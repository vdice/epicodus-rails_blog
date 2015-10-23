require 'rails_helper'

describe 'the delete a post process' do
  before do
    @post = FactoryGirl.create(:post)
  end

  it 'can delete a post' do
    visit post_path(@post)
    click_on 'Delete'
    expect(page).to_not have_content 'Alberta Park'
  end
end
