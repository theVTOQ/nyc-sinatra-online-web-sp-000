class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :"/landmarks/all"
  end
end
