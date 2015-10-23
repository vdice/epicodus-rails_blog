require 'rails_helper'

describe 'the add a post process' do
  before do
    @tag = FactoryGirl.create(:tag)
  end

  it 'can add a post' do
    visit posts_path
    expect(page).to have_content 'There are no posts, yet!'
    click_on 'add-post'
    fill_in 'title', :with => 'Alberta Park'
    fill_in 'body', :with => 'Alberta Park is a park located in northeast Portland, Oregon. Acquired in 1921, the park includes a basketball court, dog off-leash area, playground, soccer field, softball field and tennis court, as well as paved and unpaved paths and picnic tables. The park is maintained by a volunteer group known as Friends of Alberta Park.'
    find("#post_tag_ids_#{@tag.id}").set(true)
    click_on 'Submit'
    expect(page).to have_content 'Alberta Park'
    click_on 'Alberta Park'
    expect(page).to have_content @tag.name
  end

  it 'sends an error if required field is missing' do
    visit new_post_path
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
