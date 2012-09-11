class BasePresenter < Draper::Base
  # make sure content_tag and similar methods are made available
  include Draper::LazyHelpers
  include HumanizeDecorator
  include ContentHelper

  # allow form (builder) to be passed in to allow building up form inside presenter :)
  attr_reader :form

  def present object, klass = nil, &block
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    if block_given?
      block.arity > 0 ? yield(presenter) : presenter.instance_eval(&block)
    end
    presenter
  end

  def self.safe_content name, list = nil, &block
    define_method name do
      s block_given? ? instance_eval(&block) : list
    end
  end
end