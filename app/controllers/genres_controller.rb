class GenresController < ApplicationController
  before_action :require_admin, only: %i[create]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to genres_path
    else
      render :index
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def require_admin
    render file: '/public/404' unless current_admin?
  end

end
