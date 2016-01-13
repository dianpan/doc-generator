class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @document = Document.new
  end

  def create
    document = current_user.documents.build(documents_params)
    document.save ? flash[:success] = "Success, document has been created!" : flash[:error] = "Document did not save, please try again."
      redirect_to root_path
  end

  private
    def documents_params
      params.require(:document).permit(:loan_amount, :down_payment, :interest_rate)
    end
end
