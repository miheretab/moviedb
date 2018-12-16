class ChangeNullableMoviesFields < ActiveRecord::Migration[5.0]
  def change
    change_column :movies, :text, :string, :null => true
    change_column :movies, :average_rating, :float, default: 0
  end
end
