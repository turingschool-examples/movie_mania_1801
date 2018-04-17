class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:success] = "Genre #{genre.name} created!"
      redirect_to genres_path
    else
      flash[:failure] = "Problem creating genre!"
      redirect_to genres_path
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
