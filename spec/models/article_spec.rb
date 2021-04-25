require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'hannah', email: 'hannah12@gmail.com', password: '123456', password_confirmation: '123456')
  end
end