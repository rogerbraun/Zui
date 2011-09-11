class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :fragment_id
      t.string :tags
      t.text :body

      t.timestamps
    end
  end
end
