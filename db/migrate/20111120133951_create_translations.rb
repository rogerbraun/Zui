class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :source_lang
      t.string :target_lang

      t.timestamps
    end
  end
end
