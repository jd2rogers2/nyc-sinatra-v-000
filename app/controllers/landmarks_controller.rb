class LandmarksController < ApplicationController

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  post '/landmarks/:id' do
    if Landmark.find_by_id(params[:id])
      @landmark = Landmark.find_by_id(params[:id])
      @landmark.name = params[:landmark][:name]
      @landmark.year_completed = params[:landmark][:year_completed]
    else
      @landmark = Landmark.create(params[:landmark])
    end
    @landmark.save
    redirect :"/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end
end
