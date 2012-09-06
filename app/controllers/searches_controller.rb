class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def index
    @search = Search.new
    # @search = Search.create params[:search]
    # puts @search.inspect    
  end
end