require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  not_found do
    status 404
    erb :error
   end 

  get "/" do
      erb :'bride/index'
     
  end

  helpers do #access to these methods in views
    
    def logged_in?
      !!session[:bride_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/' 
      end 
    end

    def current_bride #memoization
      if @current_bride
          @current_bride
      else 
        @current_bride = Bride.find_by_id(session[:bride_id])
      end
    end
  end
# helper methods
#login? method and current_user method
end
