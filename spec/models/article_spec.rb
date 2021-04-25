require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @user = User.create(name: 'hannah', email: 'hannah12@gmail.com', password: '123456', password_confirmation: '123456')
    category = Category.create(name: 'board_games12', priority: 3)
    @article = Article.create(title: 'This is an Article',
                              text: 'dfghh hhhh jjjjj jjjjj uuuuuuu uuuuuu fddddd ggggg yyyyy ddddd dddd ddddddd',
                              image: 'https://www.ivacy.com/blog/wp-content/uploads/2016/08/watch-soccer-olympics.jpg',
                              author_id: @user.id, category_id: category.id)
  end

  it 'should have valid attributes' do
    expect(@article).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:category).without_validating_presence }
    it { should belong_to(:author).without_validating_presence }
    it { should have_many(:votes).without_validating_presence }
    it { should have_many(:voters).without_validating_presence }
  end
end