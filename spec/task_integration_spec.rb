require('capybara/rspec')
require('spec_helper')
require('./app')
require('list')
require('spec_helper')
require('task')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    fill_in('name', :with => 'Yardwork')
    click_button('Make list!')
    expect(page).to have_content('The list has been successfully submitted!')
  end
end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    visit('/')
    fill_in('name', :with => 'Homework')
    click_button('Make list!')
    click_link('Back')
    expect(page).to have_content('Homework')
  end
end
