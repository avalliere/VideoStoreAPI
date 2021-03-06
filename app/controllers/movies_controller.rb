class MoviesController < ApplicationController
  def index
    movies = Movie.all

    render json: movies.as_json(only: [:id, :title, :overview, :release_date, :inventory]), status: :ok
  end

  def show
    movie = Movie.find_by(title: params[:title])
    if movie
      render :json => movie, status: :ok
    else
      # render :json => "404 Not Found", status: :not_found
      # render status: :bad_request, :json => { errors: movie.errors.messages }
      render status: :not_found, json: {
        "404 error": { "title": ["Movie #{params[:title]} not found"]}
      }
    end
  end
end
