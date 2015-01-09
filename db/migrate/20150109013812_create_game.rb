class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :app_id
      t.string :name
      t.float :main_length
      t.float :main_with_extras_length
      t.float :completionist_length
    end
  end
end
