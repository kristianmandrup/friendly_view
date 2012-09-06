module BootstrapPresenter
  def badge number, type = :info
    content_tag :span, number, class: "badge badge-#{type}"
  end
end