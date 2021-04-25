require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  let(:user) { FactoryGirl.create(:user) }

  it 'shows login button' do
    visit new_user_path
    expect(page).to have_content('Sign Up')
  end

end
