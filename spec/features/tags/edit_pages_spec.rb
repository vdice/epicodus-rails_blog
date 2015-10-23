require 'rails_helper'

describe 'the edit a tag process' do
  before do
    @tag = FactoryGirl.create(:tag)
  end

  it 'can edit a tag' do
    visit tag_path(@tag)
    click_on 'Edit'
    fill_in 'name', :with => 'Disc Golf'
    click_on 'Submit'
    expect(page).to have_content 'Disc Golf'
  end

  it 'sends an error if required field is missing' do
    visit edit_tag_path(@tag)
    fill_in 'name', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
