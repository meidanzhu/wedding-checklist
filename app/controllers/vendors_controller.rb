class VendorsController < ApplicationController

    get '/vendors' do #get/show all vendors
        @vendors = Vendor.all
        erb :'vendor/index'
    end

    get '/vendors/new' do #get the form to make a new vendor
        erb :'vendor/new'
    end

    post '/vendors' do #create the vendor
        @vendor = Vendor.create(name: params[:vendor][:name],address: params[:vendor][:address],telephone: params[:vendor][:telephone], email: params[:vendor][:email],category: params[:vendor][:category])

         redirect to "vendors/#{@vendor.id}"
    end

    get '/vendors/:id' do #display vendor based on :id in URL
        @vendor = Vendor.find_by_id(params[:id])
        erb :'vendor/show'
    end

    get '/vendor/:id/edit' do #show edit form of the vendor
        @vendor = Vendor.find_by_id(params[:id])
        erb :'vendor/edit'
    end

    patch '/vendor/:id' do #update vendor
        @vendor = Vendor.find_by_id(params[:id])
        @vendor.name = params[:name]
        @vendor.address = params[:address]
        @vendor.telephone = params[:telephone]
        @vendor.email = params[:email]
        @vendor.category = params[:category]
        @vendor.save

        redirect to "vendors/#{vendor.id}"
        
    end 

    delete '/vendor/:id' do #delete particular vendor
        vendor = Vendor.find_by_id(params[:id])
        vendor.destroy
        
        redirect to "/vendors"
    end

end



#seven RESTful routes
  #get/post/patch/put/delete