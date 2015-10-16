class CreatePostsTags < ActiveRecord::Migration
  def change
    create_table :posts_tags do |t|
      t.column :post_id, :integer
      t.column :tag_id, :integer
    end
  end
end
