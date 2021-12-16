require 'rails_helper'

RSpec.feature 'user index', type: :feature do
  include Mocks

  before(:each) do
    three_users
    generate_posts
    log_in
  end

  it 'displays the users\' name' do
    expect(page).to have_content 'Rubén'
    expect(page).to have_content 'Robert'
    expect(page).to have_content 'Daniel'
  end

  it 'displays the number of posts for each user' do
    expect(page).to have_content 'Number of posts: 0'
    expect(page).to have_content 'Number of posts: 1'
    expect(page).to have_content 'Number of posts: 4'
  end

  it 'redirects to the user\'s path when click' do
    click_on('Rubén')
    expect(page).to have_current_path(user_path(@ruben.id))
  end
end
