class AddUniqueTitleAndLevelToTests < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, [:level, :title], unique:true
  end
end
