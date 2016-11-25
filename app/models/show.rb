class Show < ActiveRecord::Base
  has_many :performances

  def self.generate_hash(import_file_params)
    show = Show.where(["id = ?", import_file_params["Cle spectacle"]]).first.present?
    unless show.present?
      show_params = {}
      show_params["name"] = import_file_params["Spectacle"]
      show_params["id"] = import_file_params["Cle spectacle"]
      show_params
    end
  end
end
