class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all

    erb :"/figures/all"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :"/figures/new"
  end

  get '/figures/:id' do
    #@figure = Figure.find_by_slug(params[:slug])
    @figure = Figure.find_by_slug(params[:id])

    erb :"/figures/show"
  end

  get '/figures/:slug/edit' do
    @figure = Figure.find_by_slug(params[:slug])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :"/figures/edit"
  end

  post '/figures' do
    figure = Figure.create(params["figure"])

    if !!params["title"]["name"]
      figure.titles << Title.new(params["title"])
    end

    if !!params["landmark"]["name"]
      figure.landmarks << Landmark.new(params["landmark"])
    end
    figure.save

    redirect "/figures/#{figure.slug}"
  end

  patch '/figures/:slug' do
    figure = Figure.find_by_slug(params[:slug])
    figure.update(params["figure"])
    if !!params["title"]
      figure.titles << Title.create(params["title"])
    end

    if !!params["landmark"]
      figure.landmarks << Landmark.create(name: params["landmark"])
    end
    figure.save

    redirect "/figures/#{figure.slug}"
  end
end
