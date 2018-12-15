class CreateUserRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
