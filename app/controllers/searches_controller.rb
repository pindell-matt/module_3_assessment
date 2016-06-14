class SearchesController < ApplicationController

  def index
    connection = ConnectionService.new
    
    require "pry"
    binding.pry
  end

  private
    def search_params
      params.require('zip')
    end
end
