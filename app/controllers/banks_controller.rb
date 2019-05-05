class BanksController < ApplicationController
  before_action :authenticate_account!

  def search
    if !service_bank.has_key?('error') && bank.new_record?
      Bank.transaction do
        bank.update(legal_form_id: 1,inn: rand(9999999999), kpp: 999999999,
                     ogrn: rand( 9900000000000..9999999999999),
                     name: service_bank['name'], phone: 495111111,
                     correspondent_account: service_bank['ks'])

        bank.create_legal_address(address: "#{service_bank['index']}, #{service_bank['city']}, #{service_bank['address']}")
      end
    end

    if bank.persisted?
      render json: bank, each_serializer: BankSerializer
    else
      render json: service_bank # {"error":"BIK not found"}
    end
  end

  private

  def bank
    @bank ||= Bank.find_or_initialize_by(bik: params[:bik])
  end

  def service_bank
    @new_bank ||= Services::Bank.new.get(params[:bik])
  end
end
