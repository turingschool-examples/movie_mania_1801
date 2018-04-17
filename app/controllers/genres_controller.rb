class GenresController < ApplicationController
  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    redirect_to genres_path
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
