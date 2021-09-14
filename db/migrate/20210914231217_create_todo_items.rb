class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.text :description
      t.boolean :completed
      t.date :completed_at

      t.timestamps
    end
  end
end
