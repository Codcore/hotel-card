class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :address
      t.integer :rating, default: 0
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
