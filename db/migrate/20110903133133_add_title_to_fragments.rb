class AddTitleToFragments < ActiveRecord::Migration
  def change
    add_column :fragments, :title, :string
  end
end
