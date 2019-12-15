class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.belongs_to :recipe, foreign_key: true, null: false

      t.timestamps
    end
  end
end
