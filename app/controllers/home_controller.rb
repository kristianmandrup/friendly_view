class HomeController < ApplicationController
  def page
    @search = Search.new
  end
end