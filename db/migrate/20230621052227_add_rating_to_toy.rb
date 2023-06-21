class AddRatingToToy < ActiveRecord::Migration[6.1]
  def change
    add_column :toys, :rating, :integer
  end
end
