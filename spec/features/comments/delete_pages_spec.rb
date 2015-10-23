require 'rails_helper'

describe 'delete a comment process' do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user_id => @user.id)
    @commenting_user = FactoryGirl.create(:user, :name => 'Vaughn', :email => 'V@ughn.com')
    @comment = FactoryGirl.create(:comment, :commentable_id => @post.id, :user_id => @commenting_user.id)
    @post.comments.push(@comment)
  end

  it 'cannot delete a comment if not same user' do
    login_as(@user, :scope => :user)
    visit post_path(@post)
    expect(page).to_not have_css '.delete-comment'
  end

  it 'can delete a comment to a post' do
    login_as(@commenting_user, :scope => :user)
    visit post_path(@post)
    expect(page).to have_content @comment.content
    find('.delete-comment').click
    expect(page).to_not have_content @comment.content
  end
end
