class PropertiesController < ApplicationController  
  def show
    @property = property
  end

  def index
    # @client = Places::Client.new(:api_key => 'AIzaSyAwcZYV2Zaa7sANz8M1dGMfbq6XYgz3xLc')
    # @search = @client.search(:lat => 32.8481659, :lng => -97.1952847, :types => "food", :name => "roots")
    # @search.results.first.name
    # 'Roots Coffeehouse'

    @properties = 20.times.collect { Fabricate(:property) }
  end

  protected

  def property
    # PropertyDecorator.decorate(Article.first)
    @property = decorator(:property).decorate(Property.new)
  end
end