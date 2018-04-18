class Admin::GenresController < Admin::BaseController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "SUCCESS: You created new genre: #{@genre.name}"
    else
      flash[:error] = 'ERROR: Unable to create new genre.'
    end
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
