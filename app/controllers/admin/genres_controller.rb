class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = 'You successfully created a genre'
    else
      flash[:failure] = 'You failed to create the genre'
    end
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
