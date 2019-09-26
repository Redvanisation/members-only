module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    def remember(user)
        user.change_token
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
      end


      def set_current_user
        current_user = user if user 
    end 

      def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
           if user && user.authenticate(cookies[:remember_token])
            log_in user 
            @current_user = user
           end 
        end 
      end

      def sign_out
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
        session.delete(:user_id)
        @current_user = nil
      end

def logged_in?
  !current_user.nil?
end
   
     
    
end
