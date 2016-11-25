class Reservation < ActiveRecord::Base
  belongs_to :imported_file
  has_many :tickets
  belongs_to :client

    def self.generate_hash(import_file_params, client_id, file_id)
    reservation = Reservation.where(["id = ?", import_file_params["Reservation"]]).first
    unless reservation.present?
      reservation_params = {}
      reservation_params["id"] = import_file_params["Reservation"]
      reservation_params["client_id"] = client_id
      reservation_params["imported_file_id"] = file_id
      reservation_params["seller"] = import_file_params["Filiere de vente"]
      reservation_params["cart_id"] = import_file_params["Commande"] if import_file_params["Commande"].present?
      date = import_file_params["Date reservation"]
      date = date[6] + date[7] + "/"  + date[3] + date[4] + "/" + date[0] + date[1]
      datetime = date + " " + import_file_params["Heure reservation"]
      reservation_params["date"] = DateTime.parse(datetime)
      reservation_params
    end
  end
end
