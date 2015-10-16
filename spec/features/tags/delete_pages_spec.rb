require 'rails_helper'

describe 'the delete a tag process' do
  before do
    @tag = Tag.create(:name => 'Frisbee')
  end

  it 'can delete a tag' do
    visit tag_path(@tag)
    click_on 'Delete'
    expect(page).to_not have_content 'Frisbee'
  end
end