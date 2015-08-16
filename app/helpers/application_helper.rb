module ApplicationHelper
  helpers do
    def current_user
      @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def login(user)
      session[:user_id] = user.id
    end

    def logout!
      session[:user_id] = nil
    end

    def find_user
      @user ||= User.find_by(username: params[:username])
    end

    def bounce
      redirect '/login' unless current_user
    end
  end
end
