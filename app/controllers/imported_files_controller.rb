class ImportedFilesController < ApplicationController
  def index
    @imported_files = ImportedFile.where(user_id: current_user.id)
  end

  def show
    @imported_file = ImportedFile.includes(reservations: [:client]).find(params[:id])
  end

  def import
    file = file_params
    if file.content_type == "text/csv"
      filename = file.original_filename
      if new_file = ImportedFile.create!(name: filename, user_id: current_user.id)
        file = file_params.read
        csv = CSV.parse(file, :headers => true, :col_sep => ";")
        full_errors = ""
        shows = []
        performances = []
        tickets = []
        reservations = []
        carts = []
        csv.each do |row|
          import_file_params = row.to_hash
          shows << Show.generate_hash(import_file_params)
          client_params = Client.generate_hash(import_file_params)
          if client_params.present?
            client = Client.create!(client_params)
          else
            client = Client.find_by_email(import_file_params["Email"])
          end
          performances << Performance.generate_hash(import_file_params)
          tickets << Ticket.generate_hash(import_file_params)
          reservations << Reservation.generate_hash(import_file_params, client.id, new_file.id)
          carts << Cart.generate_hash(import_file_params["Commande"]) if import_file_params["Commande"].present?
        end
        Show.create!(shows.compact.uniq)
        Performance.create!(performances.compact.uniq)
        Ticket.create!(tickets.compact.uniq)
        Reservation.create!(reservations.compact.uniq{ |r| r["id"]})
        Cart.create!(carts.compact.uniq)
        flash[:success] = "Fichier #{new_file.name} importé avec succès, création de #{new_file.reservations.count} nouvelles réservations"
        redirect_to root_path
      else
        new_file.errors.messages.each do |k, v|
          full_errors += k.to_s + " : " + v.to_s + " / "
        end
        flash[:error] = full_errors if !full_errors.empty?
        render 'index'
      end
    end
  rescue ActionController::ParameterMissing
    flash[:error] = "Fichier inexistant ou non accepté"
    redirect_to imported_files_path
  end

  private

  def file_params
    params.require(:file)
    params.permit(:file)[:file]
  end
end
