feature 'Viewing links' do

  scenario 'seeing the links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  before(:each) do
    Link.create(url: 'https://www.google.co.uk', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'https://www.facebook.co.uk', title: 'Facebook', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'https://www.twitter.co.uk', title: 'Twitter', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'https://www.makersacademy.com', title: 'Makers', tags: [Tag.first_or_create(name: 'education')])
  end

  scenario 'filter links by tag' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Google')
      expect(page).not_to have_content('Makers')
      expect(page).to have_content('Facebook')
      expect(page).to have_content('Twitter')
    end
  end
end
