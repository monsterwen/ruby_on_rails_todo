class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      # make todo has two columns: one is name , another is discription
      t.string :name
      t.text :description
    end
  end
end
