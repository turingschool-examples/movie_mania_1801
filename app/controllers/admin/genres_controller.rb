class Admin::GenresController < Admin::BaseController
  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:success] = "#{genre.name} was successfully created"
      redirect_to genres_path
    else
      flash[:error] = "The genre was not created"
      redirect_to genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
