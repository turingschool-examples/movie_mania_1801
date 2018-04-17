class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:success] = 'Genre Created'
      redirect_to genres_path
    else
      flash.now[:danger] = 'Error. Genre not created'
      render :index

    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end 
end