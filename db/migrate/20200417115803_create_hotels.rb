class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :address
      t.integer :rating
      t.float :price

      t.timestamps
    end
  end
end
