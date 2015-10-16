require 'rails_helper'

describe 'the add a tag process' do
  it 'can add a tag' do
    visit root_path
    expect(page).to have_content 'There are no tags, yet!'
    click_on 'Add Tag'
    fill_in 'name', :with => 'Frisbee'
    click_on 'Submit'
    expect(page).to have_content 'Frisbee'
  end

  it 'sends an error if required field is missing' do
    visit new_tag_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
