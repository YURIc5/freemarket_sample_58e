require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "populates an array of items ordered by id DESC" do
      items = create_list(:item, 3) 
      get :index
      expect(assigns(:items)).to match(items.sort{ |a, b| b.id <=> id } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end