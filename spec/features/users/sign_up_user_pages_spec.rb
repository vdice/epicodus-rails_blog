require 'rails_helper'

describe 'the user signup process' do
  before do
    @user = FactoryGirl.create(:user)
  end

  it 'can signup a user' do
    visit new_user_registration_path
    fill_in 'Name', :with => 'Steve'
    fill_in 'Email', :with => 's@s.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    find('input[type="submit"]').click
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it 'can view a user' do
    visit user_path(@user)
    expect(page).to have_content @user.name
  end
end
