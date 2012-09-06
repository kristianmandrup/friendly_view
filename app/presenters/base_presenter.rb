class BasePresenter < Draper::Base
  # make sure content_tag and similar methods are made available
  include Draper::LazyHelpers
  include HumanizeDecorator

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

  def form form = nil
    return @form unless form
    @form = form
    self
  end

  # capture block of content and return as safe html
  def capture_content &block
    block_given? ? block.call.html_safe : "".html_safe
  end

  def s *args, &block
    output = args.flatten.inject("".html_safe) do |output, current_arg|      
      output << current_arg.html_safe
    end
    output << capture_content(&block) if block_given?
    output
  end

  def self.safe_content name, list = nil, &block
    define_method name do
      s block_given? ? instance_eval(&block) : list
    end
  end
end