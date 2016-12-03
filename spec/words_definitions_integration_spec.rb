require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('adds a new word on an index page') do
    visit('/')
    fill_in('vocab', :with => 'Epicodus')
    click_button('Submit')
    expect(page).to have_content('Epicodus')
  end
end

describe('the add definition path', {:type => :feature}) do
  it('returns a definition that an user enters') do
    visit('/definitions')
    fill_in('description', :with => 'a school where people from all walks of life come together to learn web and mobile development')
    click_button('Add')
    expect(page).to have_content('a school where people from all walks of life come together to learn web and mobile development')
  end
end
