class GenresController < ApplicationController
  before_action :set_genre, only: %i[show]
  before_action :current_admin?, only: %i[create]

  def index
    @genre  = Genre.new
    @genres = Genre.all
  end

  def show
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = 'Good job'
    else
      flash[:error] = 'DIR DDINR'
    end
    redirect_to genres_path
  end

  private

    def current_admin?
      render '/public/404' unless current_user.role == 'admin'
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
