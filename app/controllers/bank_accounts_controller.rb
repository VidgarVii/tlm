class BankAccountsController < ApplicationController
  before_action :authenticate_account!

  def index; end

  def new; end

  def create
    @ba = company.bank_accounts.build(ba_params)

    if @ba.save
      redirect_to company_bank_accounts_path(company)
    end
  end

  private

  helper_method :company

  def company
    @company ||= Company.find(params[:company_id])
  end

  def ba_params
    params.require(:bank_account).permit(:bank_id, :settlement_account)
  end
end
