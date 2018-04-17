class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
  end

  def create
  end
end