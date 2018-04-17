class GenresController < ApplicationController
  before_action :require_admin, only: %i[create]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def require_admin
    render file: '/public/404' unless current_admin?
  end

end
