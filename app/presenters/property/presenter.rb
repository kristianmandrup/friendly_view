class Property
  class Presenter < BasePresenter
    # make sure content_tag and similar methods are made available
    decorates :property

    delegate :profile , to: :property

    def self.decorators
      %w{compare contact cost details edit manage rating search selector search social translate}
    end

    include ParentPresenter
  end
end