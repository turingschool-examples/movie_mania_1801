class GenresController < ApplicationController
  before_action :set_genre, only: %i[show]

  def index
    @genre  = Genre.new
    @genres = Genre.all
  end

  def show
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  private

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
