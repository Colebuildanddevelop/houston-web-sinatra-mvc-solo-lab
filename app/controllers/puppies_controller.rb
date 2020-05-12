class PuppiesController < ApplicationController

    get '/puppies/index' do 
      @puppies = Puppy.all
      erb :index
    end

    get '/puppies/new' do
      erb :new 
    end

    get '/puppies/:id' do 
      @puppy = Puppy.all.find { |p| p.id == params[:id].to_i }
      erb :show 
    end

    post '/puppies/create' do
      Puppy.create(params)
      redirect '/puppies/index'
    end

    get '/puppies/:id/edit' do 
      @puppy = Puppy.all.find { |p| p.id == params[:id].to_i }
      erb :edit
    end 

    patch '/puppies/:id' do 
      @puppy = Puppy.all.find { |p| p.id == params[:id].to_i }
      @puppy.update({name: params[:name], breed: params[:breed]})
      redirect '/puppies/index'
    end

    delete '/puppies/:id' do 
      @puppy = Puppy.all.find { |p| p.id == params[:id].to_i }
      @puppy.destroy
      redirect '/puppies/index'
    end

   
end