require 'rails_helper'

describe 'the add a tag process' do
  before do
    @user = FactoryGirl.create(:user)
  end

  it 'cannot add a tag if not logged in' do
    visit tags_path
    expect(page).to_not have_css '#add-tag'
  end

  it 'can add a tag' do
    login_as(@user, scope: :user)
    visit tags_path
    expect(page).to have_content 'There are no tags, yet!'
    click_on 'add-tag'
    fill_in 'name', :with => 'Frisbee'
    click_on 'Submit'
    expect(page).to have_content 'Frisbee'
  end

  it 'sends an error if required field is missing' do
    login_as(@user, scope: :user)
    visit new_tag_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
