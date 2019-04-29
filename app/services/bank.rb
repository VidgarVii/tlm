class Services::Bank
  ROOT_ENDPOINT = "http://www.bik-info.ru/api.html?type=json".freeze

  def get(bik)
    JSON.parse(get_request(bik).body)
  end

  private

  def get_request(bik)
    http_client.get do |request|
      request.params['bik'] = bik
    end
  end

  def http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
