class ImportedFilesController < ApplicationController
  before_action :authenticate_user!
  def index
    @imported_files = ImportedFile.where(user_id: current_user.id)
  end

  def import
    params.require(:file)
    file = params.permit(:file)[:file]
    filename = file.original_filename
    @new_file = ImportedFile.create(name: filename, user_id: current_user.id)
    if @new_file.save
      redirect_to root_path
    else
      render 'index'
    end
  end
end
