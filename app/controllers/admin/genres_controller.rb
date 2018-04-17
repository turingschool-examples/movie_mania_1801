class Admin::GenresController < Admin::BaseController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "You have created a #{@genre.name} genre."
      redirect_to admin_genres_path
    else
      flash[:error] = "Your genre was not successfully created."
      redirect_to admin_genres_path
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
