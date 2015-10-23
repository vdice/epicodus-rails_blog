require 'rails_helper'

describe 'the delete a post process' do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, :user_id => @user.id)
    login_as(@user, scope: :user)
  end

  it 'can delete a post' do
    visit post_path(@post)
    click_on 'Delete'
    expect(page).to_not have_content 'Alberta Park'
  end
end
