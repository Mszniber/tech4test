class Ticket < ActiveRecord::Base
  require 'csv'
  belongs_to :performance
  belongs_to :reservation
  CSV_HEADERS = [
    "Numero billet",
    "Commande",
    "Reservation",
    "Date reservation",
    "Heure reservation",
    "Cle spectacle",
    "Spectacle",
    "Cle representation",
    "Representation",
    "Date representation",
    "Heure representation",
    "Date fin representation",
    "Heure fin representation",
    "Prix",
    "Date acces",
    "Heure acces",
    "Tarif",
    "Type de client",
    "Type de produit",
    "Serie",
    "Etage",
    "Filiere de vente",
    "Nom",
    "Prenom",
    "Email",
    "Adresse",
    "Code postal",
    "Pays",
    "Age",
    "Sexe"
  ] ## Header values of CSV

  def self.to_csv(options = {})
    CSV.generate(:col_sep => ";") do |csv|
      csv << CSV_HEADERS
      all.each do |ticket|
        csv <<
          [
            ticket.id,
            ticket.reservation.cart_id.present? ? ticket.reservation.cart_id : "",
            ticket.reservation.id,
            ticket.reservation.date.beginning_of_day.strftime("%d/%m/%y %H:%M"),
            ticket.reservation.date.strftime("%H:%M"),
            ticket.performance.show.id,
            ticket.performance.show.name,
            ticket.performance.id,
            ticket.performance.name,
            ticket.performance.date.strftime("%d/%m/%y"),
            ticket.performance.date.strftime("%H:%M"),
            ticket.performance.end_date.strftime("%d/%m/%y"),
            ticket.performance.end_date.strftime("%H:%M"),
            ticket.price,
            ticket.access_date.present? ? ticket.access_date.strftime("%d/%m/%y") : "",
            ticket.access_date.present? ? ticket.access_date.strftime("%H:%M") : "",
            ticket.pricing,
            ticket.reservation.client.type,
            ticket.product_type,
            ticket.serie,
            ticket.floor,
            ticket.reservation.seller,
            ticket.reservation.client.last_name,
            ticket.reservation.client.first_name,
            ticket.reservation.client.email,
            ticket.reservation.client.address,
            ticket.reservation.client.postal_code,
            ticket.reservation.client.country,
            ticket.reservation.client.age.present? ? ticket.reservation.client.age : "",
            ticket.reservation.client.sex.present? ? ticket.reservation.client.sex : ""
          ] ##Row values of CSV
      end
    end
  end
end
