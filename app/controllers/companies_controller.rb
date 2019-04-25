class CompaniesController < ApplicationController
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
      redirect_to dashboard_path, notice: 'Компания зарегистрирована'
    else
      render :new
    end
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
