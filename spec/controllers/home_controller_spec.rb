require 'rails_helper'

describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do
    context 'manager' do
      let!(:company)  { create(:company) }
      let(:user)           { create(:user) }

      before do
        company.employers.create(user: user, post: 1)
        login(user)
      end

      it "only user-manager returns http success" do
        get :dashboard

        expect(response).to have_http_status(:success)
      end
    end

    context 'anonym' do
      let(:user)           { create(:user) }

      before { login(user) }

      it "returns http redirect" do
        get :dashboard

        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
