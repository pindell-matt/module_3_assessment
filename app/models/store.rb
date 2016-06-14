class Store < ActiveRecord::Base

  def self.create_stores(raw_stores_data)
    raw_stores_data.map do |raw_store|
      Store.create(format_data(raw_store))
    end
  end

  private
    def self.format_data(data)
      {
        name:       data["longName"],
        city:       data["city"],
        distance:   data["distance"],
        phone:      data["phone"],
        store_type: data["storeType"],
        store_id:   data["storeId"]
      }
    end
end
