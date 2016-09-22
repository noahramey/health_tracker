require 'rails_helper'

describe FoodsController do
  describe "GET #index" do
    it "populates instance variables" do
      user = FactoryGirl.create(:user)
      food = FactoryGirl.create(:food, user_id: user.id)
      sign_in(user)
      get :index
      expect(assigns(:foods)).to eq([food])
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new food" do
        user = FactoryGirl.create(:user)
        sign_in(user)
        expect {
          post :create, params: { food: FactoryGirl.attributes_for(:food) }
        }.to change(Food,:count).by(1)
      end
    end
  end
end
