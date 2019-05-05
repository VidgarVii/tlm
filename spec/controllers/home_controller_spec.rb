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
      let(:account)           { create(:account) }

      before do
        company.employers.create(user: user, post: 1)
        login(account)
      end

      it "only user-manager returns http success" do
        get :dashboard

        expect(response).to have_http_status(:success)
      end
    end

    context 'anonym' do
      let(:account) { create(:account) }

      before { login(account) }

      it "returns http redirect" do
        get :dashboard

        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
