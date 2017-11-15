feature 'Add tags' do

  scenario 'add a tag to the link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.ft.com/'
    fill_in 'title', with: 'Financial Times'
    fill_in 'tags',  with: 'news'
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

  scenario 'I can add multiple tags to a new link' do
  visit '/links/new'
  fill_in 'url',   with: 'http://www.makersacademy.com/'
  fill_in 'title', with: 'Makers Academy'
  fill_in 'tags',  with: 'education ruby'
  click_button 'Add link'
  link = Link.first
  expect(link.tags.map(&:name)).to include('education', 'ruby')
end
end
