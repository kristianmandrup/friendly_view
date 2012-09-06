class ApplicationController < ActionController::Base
	include WorldFlags::Helper::All
  include Decorators

  include Apotomo::Rails::ControllerMethods

  before_filter :set_locale
  
  protect_from_forgery  
end
