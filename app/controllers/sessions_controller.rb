class SessionsController < ApplicationController

    get '/login' do
        erb :'/bride/login'
    end

    post '/login' do
        #find user by username
        bride = Bride.find_by_username(params[:bride][:username])
        if bride && bride.authenticate(params[:bride][:password])#check to their password is corrrect
            session[:bride_id] = bride.id 
            redirect to "/brides/#{bride.id}"
        else 
            redirect "/login"
        end
    end

    get '/logout' do #write this code first
        session.clear
        redirect to "/"
    end

    
end
#session determine if the user is logged in. If their credential is good. 