class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/show/:id' do
    @figure = Figure.create(name: params[:figure][:name])
    @figure.titles << Title.all.find_or_create_by(params[:title][:name])
    @figure.landmarks << Landmark.all.find_or_create_by(params[:landmark][:name])
    @figure.save
    redirect '/figures/show/:id'
  end

  get '/figures/show/:id' do
    @figure = Figure.all.find_by_id(params[:id])
    erb :"/figures/show"
  end
end
