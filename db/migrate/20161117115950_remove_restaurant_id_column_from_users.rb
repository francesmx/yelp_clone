class RemoveRestaurantIdColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :restaurant_id, :integer
  end
end
