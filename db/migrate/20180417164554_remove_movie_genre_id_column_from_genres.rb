class RemoveMovieGenreIdColumnFromGenres < ActiveRecord::Migration[5.1]
  def change
    remove_column :genres, :movie_genre_id
  end
end
