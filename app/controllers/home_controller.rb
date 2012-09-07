class HomeController < ApplicationController

  has_widgets do |root|
    root << widget(:cover)
    # root << widget(:bottom_bar)
  end

  def page
    @search = Search.new
  end
end