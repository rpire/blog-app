require 'rails_helper'

RSpec.feature 'user show', type: :feature do
  include Mocks
  before(:each) do
    @users = three_users
    generate_posts
    log_in
    visit user_path(@ruben.id)
  end

  it 'displays the user\'s name' do
    expect(page).to have_content @ruben.name
  end

  it 'displays the user\'s number of posts' do
    visit user_path(@robert.id)
    expect(page).to have_content "Number of posts: #{@robert.posts_counter}"
  end

  it 'displays the user\'s bio' do
    visit user_path(@daniel.id)
    expect(page).to have_content @daniel.bio
  end

  it 'shows last 3 posts of a user' do
    expect(page).to have_content 'Number of posts: 4'
    expect(page).to_not have_content @post_ru.title
  end

  it 'redirects to user_posts_path when click on "All posts"' do
    click_on 'All posts'
    expect(page).to have_current_path(user_posts_path(@ruben.id))
  end

  it 'redirects to the given post when clickled' do
    click_on @post_ruben.title
    expect(page).to have_current_path(user_post_path(@ruben.id, @post_ruben.id))
  end
end
