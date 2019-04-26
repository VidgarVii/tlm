class Services::Task
  def check_run
    puts 'Tasker Service run'
  end

  private

  def check_address_for_companies
    companies = []
    Company.find_each do |company|
      companies.push(company) if company.legal_address.nil?
    end
  end
end
