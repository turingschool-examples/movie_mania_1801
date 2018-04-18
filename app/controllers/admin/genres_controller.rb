class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "The genre was saved successfully"
      redirect_to genres_path
    else
      flash[:error] = "The genre was not saved successfully"
      redirect_to genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
