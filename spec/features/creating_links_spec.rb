feature 'Adding links' do
  scenario 'Adding a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://verde.io'
    fill_in 'title', with: 'Verde Digital'
    click_button 'Add link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Verde Digital')
    end
  end
end
