require 'rails_helper'

describe 'the delete a post process' do
  before do
    @post = Post.create(:title => 'Alberta Park', :body => 'Alberta Park is a park located in northeast Portland, Oregon. Acquired in 1921, the park includes a basketball court, dog off-leash area, playground, soccer field, softball field and tennis court, as well as paved and unpaved paths and picnic tables. The park is maintained by a volunteer group known as Friends of Alberta Park.')
  end

  it 'can delete a post' do
    visit post_path(@post)
    click_on 'Delete'
    expect(page).to_not have_content 'Alberta Park'
  end
end
