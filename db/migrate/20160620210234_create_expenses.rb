class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.date :date
      t.float :amount

      t.timestamps
    end
  end
end
