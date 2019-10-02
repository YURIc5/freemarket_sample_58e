require 'rails_helper'
describe SignupController do
  describe 'GET #member' do
    it "renders the :member template" do
      get :member
      expect(response).to render_template :member
    end
  end
end