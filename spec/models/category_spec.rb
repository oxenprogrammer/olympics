require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create(:category) }

  it 'should have valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without an name' do
    new_category = Category.new(name: nil)
    expect(new_category).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles).without_validating_presence }
  end
end
