class GenresController < ApplicationController
  before_action :set_genre, only: [:index]

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def set_genre
    if current_admin?
      @genre = Genre.new
    end
  end
end
