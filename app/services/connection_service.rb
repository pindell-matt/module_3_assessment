class ConnectionService

  def initialize
    @connection = Faraday.new(url: 'https://api.bestbuy.com') do |req|
      req.request  :url_encoded
      req.response :logger
      req.adapter  Faraday.default_adapter
    end
  end

  # curl "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=7a3heu7emrjz6qbsugmepbv6"
  def search_by_zip(zip)
    @connection.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params['format']   = 'json'
      req.params['show']     = 'longName,city,distance,phone,storeType'
      req.params['pageSize'] = 15
      req.params['apiKey']   = ENV['API_KEY']
    end
  end
end
