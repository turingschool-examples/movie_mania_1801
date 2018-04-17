class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to genres_path
    else
      flash[:notice] = "Oops something went wrong"
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
