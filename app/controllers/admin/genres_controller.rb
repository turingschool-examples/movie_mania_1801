class Admin::GenresController < Admin::BaseController

  def create
    genre = Genre.new(genre_params)
    if genre.save
      flash[:success] = "#{genre.name} created successfully!"
    else
      flash[:failure] = "Genre could not be created. Please try again!"
    end
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
