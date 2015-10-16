require 'rails_helper'

describe 'the edit a post process' do
  before do
    @post = Post.create(:title => 'alberta prk', :body => 'Alberta Park is a park located in northeast Portland, Oregon. Acquired in 1921, the park includes a basketball court, dog off-leash area, playground, soccer field, softball field and tennis court, as well as paved and unpaved paths and picnic tables. The park is maintained by a volunteer group known as Friends of Alberta Park.')
  end

  it 'can edit a post' do
    visit post_path(@post)
    click_on 'Edit'
    fill_in 'title', :with => 'Alberta Park'
    click_on 'Submit'
    expect(page).to have_content 'Alberta Park'
  end

  it 'sends an error if required field is missing' do
    visit new_post_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
