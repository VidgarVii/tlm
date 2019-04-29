class Services::Task
  # Когда запускать и где хранить данные. Кеширование?
  def run
    'Tasker Service run'
  end

  private

  def check_address_for_companies
    companies = []
    Company.find_each do |company|
      companies.push(company) if company.legal_address.nil?
    end
  end
end
