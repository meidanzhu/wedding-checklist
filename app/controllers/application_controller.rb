require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :welcome
  end

  helpers do #access to these methods in views
    
    def logged_in?
      !!session[:bride_id]
    end

    def current_user #memoization
      @current_user ||= Bride.find_by_id(session[:user_id])
    end
  end
# helper methods
#login? method and current_user method
end
