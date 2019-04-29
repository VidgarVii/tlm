require 'rails_helper'

describe BanksController, type: :controller do
  let(:user)    { create(:user) }
  let!(:bank)    { create(:company, :bank) }

  before { login(user) }

  describe "POST #new" do
    it "returns http success" do
      post :create

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #search" do
    it "returns http success" do
      post :search

      expect(response).to have_http_status(:success)
    end

    it 'return json bank' do
      post :search, params: { bik: bank.bik }

      expect(JSON.parse(response.body)['bik']).to eq bank.bik
    end

    it 'return nil if bank not exists' do
      post :search, params: { bik: 123 }

      expect(response.body).to eq 'null'
    end
  end
end
