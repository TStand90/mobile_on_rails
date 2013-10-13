class AddTopicsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :topics, :string
  end
end
