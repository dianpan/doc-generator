require 'rails_helper'

describe DocumentsController do
  before(:each) { login_with create( :user ) }
  let!(:user) { FactoryGirl.create :user}
  let!(:document) { FactoryGirl.create :document, :user_id => user.id }

  describe 'GET #index' do
    it 'should let a user see all their documents' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new document to the database' do
        expect{post :create, document: attributes_for(:document)}.to change(Document, :count).by(1)
      end
      it 'redirects to documents#index' do
        post :create, document: attributes_for(:document)
        expect(response).to redirect_to documents_path
      end
    end
  end

end