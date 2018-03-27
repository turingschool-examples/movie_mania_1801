#
class MoviesController < ApplicationController
  def index
    if params[:director_id]
      @director = Director.find(params[:director_id])
      @movies = @director.movies
    else
      @movies = Movie.all
    end
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    director = Director.find(params[:director_id])
    movie = director.movies.create(movie_params)
    redirect_to "/movies/#{movie.id}"
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
