class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end
