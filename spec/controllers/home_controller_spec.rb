require 'rails_helper'


RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it 'should show index page with status 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
