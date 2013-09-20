class AddDueDateAndBudgetToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :due_date, :date
    add_column :requests, :budget, :string
  end
end
