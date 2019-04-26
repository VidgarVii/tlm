class HomeController < ApplicationController
  def index
  end

  def dashboard
    if current_user.companies.blank?
      redirect_to new_company_path, notice: 'Вы не являетесь администратором ни одной компании. Зарегестрируйте компанию'
    end
  end

  private

  helper_method :company

  def company
    @company ||= current_user.companies.first
  end
end
