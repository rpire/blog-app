require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 7, post_id: 7) }
  before { subject.save }

  it 'checks that "author_id" is an integer' do
    subject.author_id = 7.5
    expect(subject).to_not be_valid
  end

  it 'checks that "post_id" is an integer' do
    subject.author_id = 7.5
    expect(subject).to_not be_valid
  end
end
