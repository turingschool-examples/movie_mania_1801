class RemoveMovieGenresColumnFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :movie_genre_id
  end
end
