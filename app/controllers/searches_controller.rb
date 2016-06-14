class SearchesController < ApplicationController

  def index
    connection = ConnectionService.new
    response   = connection.search_by_zip(search_params)
    @results   = JSON.parse(response.body)
    # @stores    = Store.create_stores(@results["stores"])
    @stores    = create_stores(@results["stores"])
  end

  private
    def search_params
      params.require('zip')
    end

    def create_stores(data)
      Store.create_stores(data)
    end
end
