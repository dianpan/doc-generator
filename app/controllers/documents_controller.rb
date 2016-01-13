class DocumentsController < ApplicationController
  before_action :find_user

  def new
    @document = Documents.new
  end

  def create
    document = @user.documents.build(documents_params)
    document.save ? flash[:message] = "Success, document has been created!" : flash[:error] = "Document did not save, please try again."
    redirect_to root_path
  end

  private
    def documents_params
      params.require(:document).permit(:loan_amount, :down_payment, :interest_rate)
    end

    def find_user
      @user = User.find(session[:user_id])
    end
end
