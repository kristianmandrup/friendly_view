class User
  class SessionPresenter < Presenter
    def present
      user ? signed_in : signed_out
    end

    protected

    def signed_in
      user.user_name
    end

    def signed_out
      link_to 'login', signout_path
    end    
  end
end
