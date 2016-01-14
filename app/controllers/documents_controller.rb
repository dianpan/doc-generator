class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = current_user.documents.all
  end

  def new
    @document = Document.new
  end

  def create
    document = current_user.documents.build(documents_params)
    document.save ? flash[:success] = "Success, document has been created!" : flash[:error] = "Document did not save, please try again."
      redirect_to documents_path
  end

  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = DocPdf.new(@document, view_context)
        send_data pdf.render, filename:
        "document_#{@document.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end

  end

  private
    def documents_params
      params.require(:document).permit(:loan_amount, :down_payment, :interest_rate)
    end
end
