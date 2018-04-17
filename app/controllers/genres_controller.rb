class GenresController < ApplicationController
  def new
  end


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Created new genre"
      redirect_to genres_path
    else
      flash[:success] = "Failed to create a new genre"
      redirect_to genres_path
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
