require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Rubén Pire', posts_counter: 7) }
  before { subject.save }

  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'checks that "posts_counter" is an integer' do
    subject.posts_counter = 7.5
    expect(subject).to_not be_valid
  end

  it 'checks that "posts_counter" is a positive number' do
    subject.posts_counter = -7
    expect(subject).to_not be_valid
  end
end
