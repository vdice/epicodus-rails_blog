require 'rails_helper'

describe 'add a comment process' do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user_id => @user.id)
    @commenting_user = FactoryGirl.create(:user, :name => 'Vaughn', :email => 'V@ughn.com')
  end

  it 'cannot add a comment if not logged in' do
    visit post_path(@post)
    expect(page).to_not have_content 'Create Comment'
  end

  it 'can add a comment to a post' do
    login_as(@commenting_user, :scope => :user)
    visit post_path(@post)
    fill_in 'Content', with: 'Bye'
    click_button 'Create Comment'
    expect(page).to have_content 'Bye'
    expect(page).to have_content @commenting_user.name
  end

  it 'gets error if incomplete form' do
    login_as(@commenting_user, :scope => :user)
    visit post_path(@post)
    click_button 'Create Comment'
    expect(page).to have_content 'You must supply comment content'
  end
end
