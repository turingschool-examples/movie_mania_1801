class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:error] = 'There was an error saving that genre.'
      redirect_to genres_path
    else
      flash[:notice] = "#{@genre.name} added successfully!"
      redirect_to genres_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end