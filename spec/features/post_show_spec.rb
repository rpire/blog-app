require 'rails_helper'

RSpec.feature 'user post show', type: :feature do
  include Mocks

  before(:each) do
    three_users
    generate_posts
    generate_comments
    Like.create(author_id: @robert.id, post_id: @post_ruben.id)
    @post_ruben.update_likes_counter
    log_in
    visit user_post_path(@ruben.id, @post_ruben.id)
  end

  it 'displays the title and author of the post' do
    expect(page).to have_content 'Not a Deception Anymore by Rubén'
  end

  it 'displays the comments of the post' do
    expect(page).to have_content 'I will comment this 9 more time(s).'
  end

  it 'displays the number of comments and likes of the post' do
    expect(page).to have_content 'Comments: 9, Likes: 1'
  end

  it 'displays the body of the post' do
    expect(page).to have_content 'I told you what was gonna happen.'
  end

  it 'displays the commentor\' name' do
    expect(page).to have_content 'Daniel:'
  end
end
