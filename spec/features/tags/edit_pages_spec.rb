require 'rails_helper'

describe 'the edit a tag process' do
  before do
    @tag = FactoryGirl.create(:tag)
    @admin = FactoryGirl.create(:user, email: 'admin@blog.com', is_admin: true)
  end

  it 'cannot edit a tag if not admin' do
    visit tag_path(@tag)
    expect(page).to_not have_content 'Edit'
  end

  it 'can edit a tag if admin' do
    login_as(@admin, scope: :user)
    visit tag_path(@tag)
    click_on 'Edit'
    fill_in 'name', :with => 'Disc Golf'
    click_on 'Submit'
    expect(page).to have_content 'Disc Golf'
  end

  it 'sends an error if required field is missing' do
    login_as(@admin, scope: :user)
    visit edit_tag_path(@tag)
    fill_in 'name', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
