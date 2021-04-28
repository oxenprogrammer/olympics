require 'rails_helper'
require 'faker'

RSpec.describe Vote, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:article) { FactoryGirl.create(:article, author_id: user.id, category_id: category.id) }
  let(:vote) { FactoryGirl.create(:vote, article_id: article.id, user_id: user.id) }

  it 'should have valid attributes' do
    expect(vote).to be_valid
  end

  it 'is not valid without a user' do
    new_vote = Vote.new(user_id: nil, article_id: article.id)
    expect(new_vote).to_not be_valid
  end

  it 'is not valid without an article' do
    new_vote = Vote.new(user_id: user.id, article_id: nil)
    expect(new_vote).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:article).without_validating_presence }
    it { should belong_to(:user).without_validating_presence }
  end
end
