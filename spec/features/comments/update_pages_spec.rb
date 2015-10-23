require 'rails_helper'

describe 'update a comment process' do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user_id => @user.id)
    @commenting_user = FactoryGirl.create(:user, :name => 'Vaughn', :email => 'V@ughn.com')
    @comment = FactoryGirl.create(:comment, :commentable_id => @post.id, :user_id => @commenting_user.id)
    @post.comments.push(@comment)
  end

  it 'cannot update a comment if not same user' do
    login_as(@user, :scope => :user)
    visit post_path(@post)
    expect(page).to_not have_css '.edit-comment'
  end

  it 'can update a comment to a post' do
    login_as(@commenting_user, :scope => :user)
    visit post_path(@post)
    expect(page).to have_content @comment.content
    find('.edit-comment').click
    fill_in 'Content', with: 'Hi'
    click_button 'Update Comment'
    expect(page).to have_content 'Hi'
    expect(page).to have_content @commenting_user.name
  end

  it 'gets error if incomplete form' do
    login_as(@commenting_user, :scope => :user)
    visit post_path(@post)
    find('.edit-comment').click
    fill_in 'Content', with: ''
    click_button 'Update Comment'
    expect(page).to have_content 'errors'
  end
end
