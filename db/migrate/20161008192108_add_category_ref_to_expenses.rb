class AddCategoryRefToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :category, foreign_key: {to_table: :categories}
  end
end
