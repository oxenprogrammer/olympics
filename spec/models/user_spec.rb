require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'hannah', email: 'hannah@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'should have valid attributes' do
    expect(@user).to be_valid
  end

  it 'should find user by email' do
    expect(User.find_by_email('hannah@gmail.com')).to eq(@user)
  end

  it 'should update user' do
    @user.update(email: 'han@gmail.com')
    expect(User.find_by_email('han@gmail.com')).to eq(@user)
  end

  it 'is not valid without an email' do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles).without_validating_presence }
  end

  describe 'Associations' do
    it { should have_many(:votes).without_validating_presence }
  end
end
