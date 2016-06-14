class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.float :distance
      t.string :phone
      t.string :store_type
    end
  end
end
