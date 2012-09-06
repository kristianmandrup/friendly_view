module Decorators
  # decorator(:property).decorate(property)

  # sub presenter
  # decorator(:property).decorate(property).search_presenter.search_button form
  def decorator type = :property
    clazz = "#{type.to_s.camelize}::Presenter"
    return clazz.constantize
  rescue NameError
    "Decorator for #{type} is not defined: #{clazz}"
  end

  extend self
end
