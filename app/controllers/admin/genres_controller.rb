class Admin::GenresController < Admin::BaseController

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to genres_path
    else
      flash[:error] = 'A name is required to create a genre! Try again.'
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
