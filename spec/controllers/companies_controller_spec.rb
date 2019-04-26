require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let!(:company) { create(:company, :with_address) }
  let(:user)           { create(:user) }

  before { login(user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id:company }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id:company }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy, params: { id: company }

      expect(response).to have_http_status(:success)
    end
  end

end
