class CreateFragments < ActiveRecord::Migration
  def change
    create_table :fragments do |t|
      t.string :image
      t.text :content
      t.integer :order
      t.integer :project_id

      t.timestamps
    end
  end
end
