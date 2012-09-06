class Module
  def mongoid_with *names
    monetize_orm :mongoid if names.delete(:money)

    names.each do |name|
      self.send :include, "Mongoid::#{name.to_s.camelize}".constantize
    end
  end
end

