class EditGoals2 < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :visibility, :boolean, null: false
  end
end
