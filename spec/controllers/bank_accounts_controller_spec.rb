require 'rails_helper'

describe BankAccountsController, type: :controller do
  let(:company) { create(:company) }
  let(:bank)    { create(:company, :bank) }
  let(:account)    { create(:account) }

  before { login(account) }

  describe 'GET #index' do
    before { get :index, params: { company_id: company.id } }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'render template' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new, params: { company_id: company.id } }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'render template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:post_create) { post :create,
                             params: { bank_account:
                                           {settlement_account: 40702810975000003358, bank_id: bank.id },
                                        company_id: company.id } }

    it "returns http success" do
      post_create

      expect(response).to have_http_status(:redirect)
    end

    it 'redirects to index bank_account' do
      post_create

      expect(response).to redirect_to company_bank_accounts_path(company)
    end

    it 'create bank account' do
      expect { post_create }.to change(company.bank_accounts, :count).by(1)
    end
  end
end
