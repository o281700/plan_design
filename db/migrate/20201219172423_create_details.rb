class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
