class PropertiesController < ApplicationController  
  def show
    @property = property
  end

  def index
    @properties = 20.times.collect { Fabricate(:property) }
  end

  protected

  def property
    # PropertyDecorator.decorate(Article.first)
    @property = decorator(:property).decorate(Property.new)
  end
end