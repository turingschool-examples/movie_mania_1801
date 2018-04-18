class Admin::GenresController < Admin::BaseController

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "You have created a #{@genre.name} genre."
    else
      flash[:error] = "Your genre was not successfully created."
    end
    redirect_to genres_path
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
