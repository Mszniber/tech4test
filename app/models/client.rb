class Client < ActiveRecord::Base
  has_many :reservations
  validates :email, uniqueness: true

  def find_by_email(email)
    User.where(["email = ?", email]).first
  end

  def self.generate_hash(import_file_params)
    client = self.find_by_email(import_file_params["Email"])
    unless client.present?
      client_params = {}
      client_params["last_name"] = import_file_params["Nom"]
      client_params["first_name"] = import_file_params["Prenom"]
      client_params["email"] = import_file_params["Email"]
      client_params["address"] = import_file_params["Adresse"]
      client_params["postal_code"] = import_file_params["Code postal"]
      client_params["country"] = import_file_params["Pays"]
      client_params["age"] = import_file_params["Age"].to_i if import_file_params["Age"].present?
      client_params["sex"] = import_file_params["Sexe"]=="F" ? false : true if import_file_params["Sexe"].present?
      client_params["type"] = import_file_params["Type de client"]
      client_params
    end
  end
end
