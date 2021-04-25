require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:article) { FactoryGirl.create(:article, author_id: user.id, category_id: category.id) }
  let(:vote) { FactoryGirl.create(:vote, article_id: article.id, user_id: user.id) }

  it 'shows login button' do
    visit login_path
    expect(page).to have_content('Login')
  end

  it 'allows a user to login with a registrated name' do
    visit login_path
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Login'
    visit user_path(user.id)
    expect(page).to have_content('')
  end
end
