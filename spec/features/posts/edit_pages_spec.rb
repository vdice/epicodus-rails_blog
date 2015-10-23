require 'rails_helper'

describe 'the edit a post process' do
  before do
    @post = FactoryGirl.create(:post)
    @tag = FactoryGirl.create(:tag)
    @post.tags.push(@tag)
  end

  it 'can edit a post' do
    visit post_path(@post)
    expect(page).to have_content @tag.name
    click_on 'Edit'
    fill_in 'title', :with => 'Alberta Park'
    find("#post_tag_ids_#{@tag.id}").set(false)
    click_on 'Submit'
    expect(page).to have_content 'Alberta Park'
    expect(page).to_not have_content @tag.name
  end

  it 'sends an error if required field is missing' do
    visit edit_post_path(@post)
    expect(page).to have_css "#post_tag_ids_#{@tag.id}"
    fill_in 'title', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
