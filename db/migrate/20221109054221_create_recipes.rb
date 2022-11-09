class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :portion
      t.integer :time
      t.text :content

      t.timestamps
    end
  end
end
