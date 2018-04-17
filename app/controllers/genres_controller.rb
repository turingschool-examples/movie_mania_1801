class GenresController < ApplicationController
  def index
    @allgenres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:title)
  end
end
