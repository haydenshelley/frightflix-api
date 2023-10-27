class AddHorizontalImageToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :horizontal_image, :string
  end
end
