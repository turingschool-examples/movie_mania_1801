# Admin genre controller
class Admin::GenresController < Admin::BaseController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "#{@genre.name} added successfully!"
      redirect_to genres_path
    else
      flash[:error] = "There was an error saving that genre. #{format_error}"
      @genres = Genre.all
      render :'genres/index'
    end
  end

  private

  def format_error
    @genre.errors.messages.map do |name, error|
      "#{name.capitalize} #{error.join(', ')}."
    end.join
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end