class BridesController < ApplicationController
    
    get '/signup' do #load the signup form   
        erb :'bride/new'
    end
    
    post '/signup' do #create the user and log in
        @bride = Bride.new(params[:bride]) #creating user
        if @bride.save #check that params are all filled out and not using duplicate username. user doesn't exist already.
            session[:bride_id]= @bride.id #log user in
            redirect to "/brides/#{@bride.id}"
        else 
            @errors = @bride.errors.full_messages.join(". ")
           
            erb :'bride/new'
        end
    end

    get '/brides' do #get/show all brides
        @brides = Bride.all
        erb :'bride/index'
    end

    get '/brides/:id' do
        bride = Bride.find_by_id(params[:id])
        if logged_in? 
            @bride = current_bride
            erb :'bride/show'
        end
    end

    get '/brides/:id/edit' do 
        if !logged_in?
            redirect to "/login"
        end
        @bride = current_bride
        erb :'bride/edit'
        
    end

    patch '/brides/:id' do 
        bride = Bride.find(params[:id])
        if logged_in?
          bride.update(username: params[:bride][:username])
        end
        redirect "/brides/#{bride.id}" 
      end 

end