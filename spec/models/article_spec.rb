require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:article) { FactoryGirl.create(:article, author_id: user.id, category_id: category.id) }

  it 'should have valid attributes' do
    expect(article).to be_valid
  end

  it 'is not valid without an category' do
    @article = Article.create(category_id: nil)
    expect(@article).to_not be_valid
  end

  it 'is not valid without an author' do
    @article = Article.create(author_id: nil)
    expect(@article).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:category).without_validating_presence }
    it { should belong_to(:author).without_validating_presence }
    it { should have_many(:comments).without_validating_presence }
    it { should have_many(:votes).without_validating_presence }
    it { should have_many(:voters).without_validating_presence }
  end
end
