class MedicationsController < ApplicationController

    get '/new' do
      erb :'medications/new'
    end
  
    post '/medications' do
        if params["medication"] != ""
          @medication = current_user.medications.create(medication: params[:medication])
          redirect '/list'
        else
          redirect '/new'
        end
    end
  
    get '/medications/:id' do
        @medication = current_user.medications.find(params[:id])
        redirect '/list'
    end
  
    get '/medications/:id/edit' do
        @medication= Medication.find(params[:id])
        if current_user.medications.include?(@medication)
          erb :'/medications/edit'
        else
          redirect "/list"
        end
    end
  
    patch "/medications/:id" do
      @medication = current_user.medications.find(params[:id])
      if params[:medication] != ""
        @medication.update(medication: params[:medication])
        redirect "/medications/#{@medication.id}"
      else
        redirect "/medications/#{@medication.id}/edit"
      end
    end
  
    delete '/medications/:id/delete' do
      @medication = Medication.find(params[:id])
      if current_user.medications.include?(@medication)
        @medication.delete
        redirect '/list'
      else
        redirect '/list'
      end
    end
  end