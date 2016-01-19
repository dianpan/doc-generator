class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = current_user.documents.all
  end

  def create
    document = Document.new(documents_params)
    document.user_id = current_user.id
    document.pdf_create
    document.file = File.open("loan_document.pdf")
    document.save ? flash[:success] = "Document has been created!" : flash[:error] = "Error, please try again"
    redirect_to documents_path
  end

  private
    def documents_params
      params.require(:document).permit(:loan_amount, :down_payment, :interest_rate)
    end
end
