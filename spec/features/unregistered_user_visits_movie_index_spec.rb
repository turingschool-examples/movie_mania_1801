require 'rails_helper'

context 'an unregistered user' do
  context 'visits the movies index' do
    context 'clicks on movie' do
      scenario 'sees the movie show page' do
        director = Director.create(name: 'Darth Plagueis the Wise')
        movie = director.movies.create(title: 'Guardians of the Galaxy', description: 'Bad', rating: 3)
        g1 = movie.genres.create(name: 'Action')
        g2 = movie.genres.create(name: 'Adventure')
        g3 = movie.genres.create(name: 'Sci-fi')

        visit movies_path
        click_on movie.title

        expect(page).to have_content('Genres for this Movie')
        expect(page).to have_content(movie.rating)
        expect(page).to have_content(g1.name)
        expect(page).to have_content(g2.name)
        expect(page).to have_content(g3.name)
      end
    end
  end
end