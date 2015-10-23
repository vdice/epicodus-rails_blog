# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_user = User.create(:name => 'Telperion', :email => 'telperion@redwoods.org', :password => 'password', :password_confirmation => 'password', :is_admin => true)
sample_post = Post.create(:user_id => sample_user.id, :title => 'Sample Post', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam facilisis faucibus felis vitae sagittis. Duis at tellus vitae massa venenatis pretium. Ut cursus eu sapien ut gravida. Pellentesque eleifend facilisis purus at malesuada. Mauris convallis felis in diam dictum, non lacinia lectus aliquam. Suspendisse volutpat malesuada velit, ac ultricies eros commodo eget. Proin sed sem convallis, sagittis augue ut, consequat ipsum. Vivamus viverra tristique nibh, a venenatis odio.

Vivamus sodales ante tortor, vitae luctus ligula fringilla a. Suspendisse tempus elit in elit fringilla, ut elementum nunc elementum. Aliquam nulla nisi, imperdiet sed molestie eu, viverra quis nisi. Donec vehicula massa mi, laoreet iaculis risus congue sed. Etiam nibh erat, accumsan eu neque et, aliquam ultricies turpis. Vivamus convallis urna ac elit faucibus, et lobortis purus lacinia. Integer in dolor velit.')

sample_tag = Tag.create(:name => 'Sample Tag')
sample_post.tags.push(sample_tag)

sample_comment = Comment.create(:content => 'Standing tall!', :user_id => sample_user.id, :commentable_type => 'Post', :commentable_id => sample_post.id)
sample_post.comments.push(sample_comment)
