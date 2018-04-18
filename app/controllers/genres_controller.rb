class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre  = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
