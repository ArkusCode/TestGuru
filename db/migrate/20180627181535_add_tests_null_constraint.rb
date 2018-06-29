class AddTestsNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)    
  end
end
