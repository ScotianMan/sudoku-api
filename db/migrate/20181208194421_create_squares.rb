class CreateSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :squares do |t|
      t.integer :value, :null => false, :default => 0
      t.integer :row, :null => false, :default => 0
      t.integer :column, :null => false, :default => 0
      t.integer :block, :null => false, :default => 0
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
