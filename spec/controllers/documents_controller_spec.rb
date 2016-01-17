require 'rails_helper'

describe DocumentsController do
  describe "user settings" do
    let(:authed_user) { create_logged_in_user }

    it "should allow access" do
      get :index
      response.should be_success
      # visit user_settings_path(authed_user)
    end
  end
#   before(:each) { session[:user_id] = user.id }
#   let!(:user) { FactoryGirl.create :user }
#   let!(:document1) { FactoryGirl.create :document, :user_id => user.id }
#   let!(:document2) { FactoryGirl.create :document, :user_id => user.id }

#   describe 'GET #index' do
#     it 'assigns all current user documents to @documents' do
#       get :index
#       expect(user.documents.all.length).to eq(2)
#     end

#     it 'assigns a new Document to @document' do
#       get :index
#       expect(assigns(:document)).to be_a_new Document
#     end
#   end

#   describe 'GET #new' do
#     it 'assigns a new Document to @document'
#   end

#   describe 'POST #create' do
#     context 'with valid attributes' do
#       it 'saves the new document to the database '
#       it 'redirects to documents#index'
#     end

#     context 'with invalid attributes' do
#       it 'does not save the new document in the database'
#       it 're-renders the :form template'
#     end
#   end

end