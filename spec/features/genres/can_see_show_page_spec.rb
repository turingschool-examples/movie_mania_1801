require 'rails_helper'

context 'an unregistered user' do
  context 'visits the show page from the index' do
    scenario 'they see the show page' do
      director = Director.create(name: 'Darth Plagueis the Wise')
      movie1 = director.movies.create(title: 'Guardians of the Galaxy', description: 'Bad', rating: 3)
      movie2 = director.movies.create(title: 'Some movie', description: 'Bad', rating: 3)
      genre = Genre.create(name: 'Action')

      genre.movies << movie1
      genre.movies << movie2

      visit genres_path

      click_on genre.name

      expect(current_path).to eq(genre_path(genre))
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(genre.average_rating)
    end
  end
end