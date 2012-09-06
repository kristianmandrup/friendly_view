class User
  class Presenter < BasePresenter
    decorates :user

    def self.decorators
      %w{search}
    end

    include ParentPresenter
  end
end
