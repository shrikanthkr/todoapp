class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	t.references :user
    	t.string :title
      	t.text :description
      	t.date :to_date
      	t.time :to_time
      	t.timestamps
    end
  end
end
