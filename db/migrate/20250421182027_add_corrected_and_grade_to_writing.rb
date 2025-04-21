class AddCorrectedAndGradeToWriting < ActiveRecord::Migration[8.0]
  def change
    add_column :writings, :state, :integer, default: 0
    add_column :writings, :grade, :integer, default: 0
  end
end
