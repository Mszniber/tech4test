class Performance < ActiveRecord::Base
  belongs_to :show
  has_many :tickets

  def self.generate_hash(import_file_params)
    performance = Performance.where(["id = ?", import_file_params["Cle representation"]]).first
    unless performance.present?
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
      performance_params
    end
  end

end
