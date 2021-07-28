class EditGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :completed, :boolean, null: false
  end
end
