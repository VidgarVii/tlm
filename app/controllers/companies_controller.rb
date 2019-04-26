class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    legal_form = LegalForm.find(params[:trader][:legal_form_id])
    @company = legal_form.companies.build(company_params)

    redirect_to dashboard_path, notice: 'Компания зарегистрирована' if @company.save

    p @company.errors.full_messages
  end

  def edit
  end

  def destroy
  end

  private

  helper_method :company

  def company
    @company ||= Company.find_or_initialize_by(params[:id])
  end

  def company_params
    params.require(:trader).permit(:name, :inn, :kpp, :phone, :email)
  end
end
