class VendorsController < ApplicationController

    get '/vendors' do #get/show all vendors
        if logged_in?
        @vendors = Vendor.all
        erb :'vendor/index'
        end
    end

    get '/vendors/new' do #get the form to make a new vendor
        erb :'vendor/new'
    end

    post '/vendors' do #create the vendor
        if params[:vendor][:name] == "" || params[:vendor][:address] == "" || params[:vendor][:telephone] == "" || params[:vendor][:email] == "" || params[:vendor][:category] == ""
            redirect to '/vendors/new'
        elsif
        #check to make sure someone is logged in. able to see vendor when logged out?
        #check that some/all params are filled in.
        @vendor = Vendor.create(name: params[:vendor][:name],address: params[:vendor][:address],telephone: params[:vendor][:telephone], email: params[:vendor][:email],category: params[:vendor][:category], bride_id: session[:bride_id])
        @vendor.save 
        redirect "/vendors/#{@vendor.id}"
        else 
            redirect to "/vendors/new"
        end
    end

    get '/vendors/:id' do #display vendor based on :id in URL
        if logged_in?
            @vendor = Vendor.find_by_id(params[:id])
            erb :'vendor/show'
        else
            redirect to "/login"
        end
    end

    get '/vendors/:id/edit' do #show edit form of the vendor. cannot edit unless vendor id match session id. 
        @vendor = Vendor.find_by_id(params[:id])
        if @vendor && @vendor.bride_id == current_bride.id
            erb :'vendor/edit'
        else
          redirect to '/login'
        end

    end

    patch '/vendors/:id' do #update vendor
        @vendor = Vendor.find(params[:id])
        if logged_in? && @vendor.bride == current_bride
        @vendor.update(params[:vendor])
        redirect "/vendors/#{@vendor.id}"
        end
    end 

    delete '/vendors/:id' do #delete particular vendor
        vendor = Vendor.find(params[:id])
        if logged_in? && vendor.bride == current_bride
        vendor.destroy
        redirect "/vendors/#{current_bride.id}"
        else
          redirect to '/login'
        end
       
    end

end



#seven RESTful routes
  #get/post/patch/put/delete