describe 'As an unregister user,' do
  describe 'When I visit the genre index' do
    it 'I can visit a genre show page' do
      genre = Genre.create!(name: "Action")
      genre2 = Genre.create!(name: "Adventure")
      visit genres_path

      expect(page).to_not have_button('Create Genre')

      expect(page).to have_link(genre.name)
      expect(page).to have_link(genre2.name)
    end
  end
end
