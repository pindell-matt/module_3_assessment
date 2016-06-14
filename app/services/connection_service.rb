class ConnectionService

  def initialize
    @connection = Faraday.new(url: 'https://api.bestbuy.com') do |req|
      req.request  :url_encoded
      req.response :logger
      req.adapter  Faraday.default_adapter
    end
  end

end
