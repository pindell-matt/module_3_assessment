class SearchesController < ApplicationController

  def index
    response = connection.search_by_zip(search_params)
    @results = JSON.parse(response.body)
    @stores  = create_stores(@results["stores"])
  end

  private
    def search_params
      params.require('zip')
    end

    def create_stores(data)
      Store.create_stores(data)
    end

    def connection
      ConnectionService.new
    end
end
