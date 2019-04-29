class BankAccountsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new; end

  def create
    if company.payment_accounts.create(ba_params)
      redirect_to dashboard_path
    end
  end

  private

  helper_method :company, :bank_account

  def bank_account
    @bank_account ||= BankAccount.find_or_initialize_by(params[:id])
  end

  def company
    @company ||= Company.find(params[:company_id])
  end

  def ba_params
    params.require(:bank_account).permit(:bank_id, :settlement_account)
  end
end
