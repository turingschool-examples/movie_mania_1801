
class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "The genre was saved successfully"
      redirect_to genres_path
    else
      @genres = Genre.all
      flash[:error] = "The genre was not saved successfully"
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
