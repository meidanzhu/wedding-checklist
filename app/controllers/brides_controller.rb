class BridesController < ApplicationController
    
    get '/signup' do #load the signup form
        erb :'bride/new'
    end
    
    post '/signup' do #create the user and log in
        bride = Bride.new(params[:bride]) #creating user
        if bride.save #check that params are all filled out and not using duplicate username. user doesn't exist already.
            session[:bride_id]= bride.id #log user in
            redirect to "/brides"
        else 
            @error = user.errors.full_messages.join(". ")
            erb :'bride/new'
        end
    end

    get '/brides' do #get/show all brides
        @brides = Bride.all
        erb :'bride/index'
    end

    get '/brides/:id' do #display bride based on :id in URL
        @bride = bride.find_by_id(params[:id])
        erb :'bride/show'
    end

    get '/brides/:id/edit' do 
        
        erb :'bride/edit'
    end

    patch '/brides/:id' do
        
        redirect to "/brides/#{bride.id}"
    end
end