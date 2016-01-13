class DocumentsController < ApplicationController
  def new
    @document = current_user.documents.new
  end

  private
  def documents_params
    params.require(:document).permit(:)
  end
end
