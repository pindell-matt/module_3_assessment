class ConnectionService

  def initialize
    @connection = Faraday.new(url: 'https://api.bestbuy.com') do |req|
      req.request  :url_encoded
      req.response :logger
      req.adapter  Faraday.default_adapter
    end
  end

  def search_by_zip(zip)
    @connection.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params['format']   = 'json'
      req.params['show']     = 'longName,city,distance,phone,storeType,storeID'
      req.params['pageSize'] = 15
      req.params['apiKey']   = ENV['API_KEY']
    end
  end

  def store_details(store_id)
    @connection.get do |req|
      req.url "/v1/stores(storeId=#{store_id})"
      req.params['format']   = 'json'
      req.params['show']     = 'postalCode,region,hours,hoursAmPm,gmtOffset,detailedHours'
      req.params['apiKey']   = ENV['API_KEY']
    end
  end

end
