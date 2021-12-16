require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    User.create(
      id: 1,
      name: 'Rubén Pire',
      posts_counter: 0
    )
  end

  subject do
    Post.new(
      author_id: 1,
      title: 'Why I Love Cheeseburgers',
      text: 'I love cheeseburgers because they have cheese.',
      comments_counter: 7,
      likes_counter: 7
    )
  end

  before { subject.save }

  it 'checks for the presence of "title"' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'checks for the length of the post\'s content' do
    subject.text = '12345' * 51
    expect(subject).to_not be_valid
  end

  it 'checks that "comments_counter" is an integer' do
    subject.comments_counter = 7.5
    expect(subject).to_not be_valid
  end

  it 'checks that "comments_counter" is a positive number' do
    subject.comments_counter = -7
    expect(subject).to_not be_valid
  end

  it 'checks that "likes_counter" is an integer' do
    subject.likes_counter = 7.5
    expect(subject).to_not be_valid
  end

  it 'checks that "likes_counter" is a positive number' do
    subject.likes_counter = -7
    expect(subject).to_not be_valid
  end
end
