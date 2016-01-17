require 'rails_helper'

describe DocumentsController do
  before(:each) { login_with create( :user ) }
  # let!(:document1) { FactoryGirl.create :document, :user_id => user.id }
  # let!(:document2) { FactoryGirl.create :document, :user_id => user.id }

  describe 'GET #index' do
    it 'should let a user see all their documents' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns a new Document to @document' do
      get :index
      expect(assigns(:document)).to be_a_new Document
    end
  end

  describe 'GET #new' do
    it 'assigns a new Document to @document'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new document to the database '
      it 'redirects to documents#index'
    end

    context 'with invalid attributes' do
      it 'does not save the new document in the database'
      it 're-renders the :form template'
    end
  end

end