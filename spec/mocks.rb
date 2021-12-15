require 'user'

module Mocks
  def three_users
    @ruben = User.create(
      name: 'Rubén',
      email: 'ruben@email.com',
      password: 'iloveburgers',
      confirmed_at: Time.now
    )

    @robert = User.create(
      name: 'Robert',
      email: 'robert@email.com',
      password: 'ilovecachitos',
      confirmed_at: Time.now
    )

    @daniel = User.create(
      name: 'Daniel',
      email: 'daniel@email.com',
      password: 'ilovelasagna',
      confirmed_at: Time.now
    )

    [@ruben, @robert, @daniel]
  end

  def generate_posts
    @post_ru = Post.new(
      author_id: @ruben.id,
      title: 'I Love Burgers',
      text: 'I really love burgers.'
    )

    @post_ro = Post.new(
      author_id: @robert.id,
      title: 'I Love Cachitos',
      text: 'I really love cachitos.'
    )

    @post_rub = Post.new(
      author_id: @ruben.id,
      title: 'Deception',
      text: 'You thought this would be your post, Daniel?'
    )

    @post_rube = Post.new(
      author_id: @ruben.id,
      title: 'Deceptionx2',
      text: 'From now on, all posts are mine'
    )

    @post_ruben = Post.new(
      author_id: @ruben.id,
      title: 'Not a Deception Anymore',
      text: 'I told you what was gonna happen.'
    )

    @posts = [@post_ru, @post_ro, @post_rub, @post_rube, @post_ruben]

    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
      post.save
    end

    @ruben.update_posts_counter
    @robert.update_posts_counter
    @daniel.update_posts_counter

    @posts
  end

  def generate_comments
    i = 9
    until i < 1
      Comment.create(
        author_id: @daniel.id,
        post_id: @post_ruben.id,
        text: "I will comment this #{i} more time(s)."
      )
      i -= 1
    end
    @post_ruben.update_comments_counter
  end

  def log_in
    visit user_session_path
    fill_in 'Email', with: 'ruben@email.com'
    fill_in 'Password', with: 'iloveburgers'
    click_button 'Log in'
  end
end
