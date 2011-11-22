class AddCommentCountToFragment < ActiveRecord::Migration
  def change
    add_column :fragments, :comments_count, :integer
  end
end
