require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:article) { FactoryGirl.create(:article, author_id: user.id, category_id: category.id) }
  let(:comment) { FactoryGirl.create(:comment, user_id: user.id, article_id: article.id, text: 'Hello, how are you?') }

  it 'should have valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without an article' do
    @comment = Comment.create(article_id: nil, user_id: user.id, text: 'hello, how are you?')
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a user' do
    @comment = Comment.create(article_id: article.id, user_id: nil, text: 'hello, how are you?')
    expect(@comment).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:article).without_validating_presence }
  end
end
