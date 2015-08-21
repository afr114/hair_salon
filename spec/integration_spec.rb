require('capybara/rspec')
require('launchy')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new staff member', {:type => :feature}) do
  it('allows a user to view a list of staff members') do
    visit('/staff_members')
    click_link('Click here to add staff')
    fill_in('name', :with => 'Thomas Wayne')
    click_button('Add')
    expect(page).to have_content('Employee\'s Page')
  end
end

describe('adding a new client', {:type => :feature}) do
  it('allows a user to add a new client') do
    visit('/clients')
    click_link('Click here to add a new client')
    fill_in('name', :with => 'Dick Grayson')
    click_button('Add')
    expect(page).to have_content('Medici\'s Current Clients')
  end
end
