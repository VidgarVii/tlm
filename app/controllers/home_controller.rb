class HomeController < ApplicationController
  def index
  end

  def dashboard
    if current_user.companies.blank?
      redirect_to new_company_path, notice: 'Вы не являетесь администратором ни одной компании. Зарегестрируйте компанию'
    end
  end
end
