class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = current_user.documents.all
  end

  def new
    @document = Document.new
  end

  def create
    document = Document.new(documents_params)
    document.user_id = current_user.id
    pdf = DocPdf.new(document, view_context)
    file_name = "loan_document_#{current_user.id}.pdf"
    pdf.render_file(file_name)
    document.file = File.open(file_name)

    document.save! ? flash[:success] = "Success, document has been created!" : flash[:error] = "Document did not save, please try again."
    redirect_to documents_path
  end

  private
    def documents_params
      params.require(:document).permit(:loan_amount, :down_payment, :interest_rate)
    end
end
