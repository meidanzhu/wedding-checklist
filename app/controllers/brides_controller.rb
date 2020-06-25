class BridesController < ApplicationController
    
    get '/brides' do #get/show all brides
        @brides = Bride.all
        erb :'bride/index'
    end

    get '/brides/new' do #get the form to make a new bride
        @vendors = Vendor.all
        erb :'bride/new'
    end

    post '/brides' do #create the bride
        
         redirect to "brides/#{@bride.id}"
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