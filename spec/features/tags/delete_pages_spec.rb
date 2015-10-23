require 'rails_helper'

describe 'the delete a tag process' do
  before do
    @tag = FactoryGirl.create(:tag)
    @admin = FactoryGirl.create(:user, email: 'admin@blog.com', is_admin: true)
  end

  it 'cannot delete a tag if not admin' do
    visit tag_path(@tag)
    expect(page).to_not have_content 'Delete'
  end

  it 'can delete a tag if admin' do
    login_as(@admin, scope: :user)
    visit tag_path(@tag)
    click_on 'Delete'
    expect(page).to_not have_content 'Frisbee'
  end
end
