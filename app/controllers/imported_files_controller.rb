class ImportedFilesController < ApplicationController
  require 'csv'
  before_action :authenticate_user!
  def index
    @imported_files = ImportedFile.where(user_id: current_user.id)
  end

  def import
    file = file_params
    csv = CSV.parse(file, :headers => true, :col_sep => ";")
    full_errors = ""
    csv.each do |row|
      import_file_params = row.to_hash
      show = create_show(import_file_params)
      client = create_client(import_file_params)
      performance = create_performance(import_file_params)
      ticket = create_ticket(import_file_params)
    end
    file = params.permit(:file)[:file]
    filename = file.original_filename
    @new_file = ImportedFile.create(name: filename, user_id: current_user.id)
    if @new_file.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def create_ticket(import_file_params)
    ticket_params = {}
    ticket_params["id"] = import_file_params["Numero billet"]
    ticket_params["reservation_id"] = import_file_params["Reservation"]
    ticket_params["performance_id"] = import_file_params["Cle representation"]
    ticket_params["serie"] = import_file_params["Serie"]
    ticket_params["floor"] = import_file_params["Etage"]
    ticket_params["product_type"] = import_file_params["Type de produit"]
    ticket_params["pricing"] = import_file_params["Tarif"]
    ticket_params["price"] = import_file_params["Prix"]
    if import_file_params["Date acces"].present?
      access_date = import_file_params["Date acces"]
      access_date = access_date[6] + access_date[7] + "/"  + access_date[3] + access_date[4] + "/" + access_date[0] + access_date[1]
      access_datetime = access_date + " " + import_file_params["Heure acces"]
      ticket_params["access_date"] = DateTime.parse(access_date)
    end
    ticket = Ticket.new(ticket_params) unless Ticket.where(["id = ?", ticket_params["id"]]).first.present?
    ticket if ticket.present? && ticket.save
  end

  def create_performance(import_file_params)
    performance_params = {}
    performance_params["id"] = import_file_params["Cle representation"]
    performance_params["name"] = import_file_params["Representation"]
    performance_params["show_id"] = import_file_params["Cle spectacle"]
    date = import_file_params["Date representation"]
    date = date[6] + date[7] + "/"  + date[3] + date[4] + "/" + date[0] + date[1]
    datetime = date + " " + import_file_params["Heure representation"]
    performance_params["date"] = DateTime.parse(datetime)
    end_date = import_file_params["Date fin representation"]
    end_date = end_date[6] + end_date[7] + "/"  + end_date[3] + end_date[4] + "/" + end_date[0] + end_date[1]
    end_datetime = end_date + " " + import_file_params["Heure fin representation"]
    performance_params["end_date"] = DateTime.parse(datetime)
    performance = Performance.new(performance_params) unless Performance.where(["id = ?", performance_params["id"]]).first.present?
    performance if performance.present? && performance.save
  end

  def create_show(import_file_params)
    show_params = {}
    show_params["name"] = import_file_params["Spectacle"]
    show_params["id"] = import_file_params["Cle spectacle"]
    show = Show.new(show_params) unless Show.where(["id = ?", show_params["id"]]).first.present?
    show if show.present? && show.save
  end

  def create_client(import_file_params)
    client_params = {}
    client_params["last_name"] = import_file_params["Nom"].to_s
    client_params["first_name"] = import_file_params["Prenom"]
    client_params["email"] = import_file_params["Email"]
    client_params["address"] = import_file_params["Adresse"]
    client_params["postal_code"] = import_file_params["Code postal"]
    client_params["country"] = import_file_params["Pays"]
    client_params["age"] = import_file_params["Age"].to_i if import_file_params["Age"].present?
    client_params["sex"] = import_file_params["Sexe"]=="F" ? false : true if import_file_params["Sexe"].present?
    client_params["type"] = import_file_params["Type de client"]
    client = Client.new(client_params) unless Client.find_by_email(client_params["email"]).present?
    client if client.present? && client.save
  end

  private
  def file_params
    params.require(:file)
    params.permit(:file)[:file].read
  end
end
