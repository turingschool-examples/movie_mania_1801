class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre  = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = 'You successfully created a genre'
      redirect_to genres_path
    else
      flash[:failure] = 'You failed to create the genre'
      redirect_to genres_path
      end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
