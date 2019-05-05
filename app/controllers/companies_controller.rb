class CompaniesController < ApplicationController
  before_action :authenticate_account!

  def index
  end

  def show
  end

  def new
  end

  def create
    legal_form = LegalForm.find(params[:trader][:legal_form_id])
    @company = legal_form.companies.build(company_params)

    if @company.save
      @company.employers.create(user_id: current_account.id, post: 1)
      redirect_to dashboard_path, notice: 'Компания зарегистрирована'
    end
  end

  def edit
  end

  def update
    if company.update(company_params)
      redirect_to dashboard_path, notice: 'Компания сохранена'
    end
  end

  def destroy
  end

  private

  helper_method :company

  def company
    @company ||= Company.find_or_initialize_by(id: params[:id])
  end

  def company_params
    params.require(:trader).permit(:name, :logo, :inn, :kpp, :ogrn, :phone, :email)
  end
end
