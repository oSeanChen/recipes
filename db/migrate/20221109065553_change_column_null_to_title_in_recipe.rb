class ChangeColumnNullToTitleInRecipe < ActiveRecord::Migration[6.1]
  def change
    change_column_null :recipes, :title, false
  end
end
