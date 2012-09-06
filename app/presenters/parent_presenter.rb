module ParentPresenter
  extend ActiveSupport::Concern

  included do 
    decorators.each do |name|
      meth = "#{name}_presenter"
      model = self.name.split('::').first
      define_method meth do
        begin
          clazz = "#{model}::#{name.to_s.camelize}Presenter"
          clazz.constantize.decorate property
        rescue NameError
          "#{meth} - Decorator for #{clazz} is not defined :("
        end
      end
    end
  end
end