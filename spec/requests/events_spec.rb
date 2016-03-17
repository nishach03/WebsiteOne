require 'spec_helper'
require 'capybara/rspec'
describe 'Events' do

  let(:user){ User.create!(email: 'something_else@email.com', password: '123456789')}

  before { login }

  it 'allows prepopulation of form with name' do
    visit new_event_path(name: 'Blah')
    expect(page).to have_selector("input#event_name[value='Blah']")
  end

  it 'allows prepopulation of form with category' do
    visit new_event_path(category: 'Scrum')
    expect(page).to have_select('Category', selected: 'Scrum')
  end

  def login
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '123456789'
    click_button 'Sign in'
  end
end