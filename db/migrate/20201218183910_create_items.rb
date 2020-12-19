class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.references :plan, null: false, foreign_key: true
      t.timestamps
    end
  end
end
