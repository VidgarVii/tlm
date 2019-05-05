require 'rails_helper'

describe BanksController, type: :controller do
  let(:accounts)    { create(:accounts) }
  let!(:bank)  { create(:company, :bank) }

  before { login(accounts) }

  describe "POST #search" do
    it "returns http success" do
      post :search

      expect(response).to have_http_status(:success)
    end

    it 'return json bank' do
      post :search, params: { bik: bank.bik }

      expect(JSON.parse(response.body)['bank']['bik']).to eq bank.bik
    end

    it 'return nil if bank not exists' do
      post :search, params: { bik: 123 }

      expect(response.body).to eq '{"error":"BIK not found"}'
    end
  end
end
