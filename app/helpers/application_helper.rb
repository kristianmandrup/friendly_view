module ApplicationHelper

  # https://groups.google.com/forum/?fromgroups=#!topic/rubyonrails-talk/ISoR3qsqjPg
  # http://www.postal-code.com/mrhappy/blog/2007/01/18/rails-knowing-the-current-action-in-a-view/

  # controller.controller_name
  # controller.action_name

  def current_user
    session[:user] ||= User.new 'kmandrup'
  end
end
