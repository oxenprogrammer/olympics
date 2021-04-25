require 'rails_helper'
require 'faker'

RSpec.describe Vote, type: :model do
  before(:all) do
    user = User.create(name: 'hannah', email: 'hannah@gmail.com', password: '123456', password_confirmation: '123456')
    category = Category.create(name: 'soccer', priority: 3)
    article = Article.create(title: 'This is an Article', text: 'dfghh hhhh jjjjj jjjjj uuuuuuu uuuuuu fddddd ggggg yyyyy ddddd dddd ddddddd', image: 'https://www.ivacy.com/blog/wp-content/uploads/2016/08/watch-soccer-olympics.jpg', author_id: user.id, category_id: category.id)
    @vote = Vote.create(article_id: article.id, user_id: user.id)
  end

  it 'should have valid attributes' do
    expect(@vote).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:article).without_validating_presence }
    it { should belong_to(:user).without_validating_presence }
  end
end
