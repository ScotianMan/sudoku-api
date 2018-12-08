class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :size, :null => false, :default => 9

      t.timestamps
    end
  end
end
