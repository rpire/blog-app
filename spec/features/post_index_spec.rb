require 'rails_helper'

RSpec.feature 'user post index', type: :feature do
  include Mocks

  before(:each) do
    three_users
    generate_posts
    generate_comments
    Like.create(author_id: @robert.id, post_id: @post_ruben.id)
    @post_ruben.update_likes_counter
    log_in
    visit user_posts_path(@ruben.id)
  end

  it 'displays the user\'s name' do
    expect(page).to have_content @ruben.name
  end

  it 'displays the user\'s post counter' do
    expect(page).to have_content 'Number of posts: 4'
  end

  it 'displays the title and text of one of the user\'s posts' do
    expect(page).to have_content @post_ruben.title
    expect(page).to have_content @post_ruben.text
  end

  it 'displays the first comment of a post' do
    expect(page).to have_content 'I will comment this 5 more time(s).'
  end

  it 'displays the number of comments and likes of a post' do
    expect(page).to have_content 'Comments: 9, Likes: 1'
  end

  it 'redirects to the given post when clickled' do
    click_on @post_ruben.title
    expect(page).to have_current_path(user_post_path(@ruben.id, @post_ruben.id))
  end
end
