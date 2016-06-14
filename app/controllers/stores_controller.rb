class StoresController < ApplicationController

  def show
    @store = Store.find(params["store_id"])
  end
end
