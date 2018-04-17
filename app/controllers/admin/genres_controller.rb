class Admin::GenresController < Admin::BaseController

  def index
  end

  def new
    @genre = Genre.new
  end

end
