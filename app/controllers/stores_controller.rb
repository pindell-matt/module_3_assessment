class StoresController < ApplicationController

  def show
    @store      = Store.find(params["store_id"])
    detail_data = connection.store_details(@store.store_id)
    @details    = JSON(detail_data.body)
  end

  private
    def connection
      ConnectionService.new
    end
end
