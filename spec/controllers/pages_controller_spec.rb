require 'rails_helper'

describe PagesController do
  describe 'GET #index' do
    it 'should show unsigned in users the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end