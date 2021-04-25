require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category = Category.create(name: 'athletics1', priority: 1)
  end

  it 'should have valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without an name' do
    category = Category.new(name: nil)
    expect(category).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles).without_validating_presence }
  end
end
