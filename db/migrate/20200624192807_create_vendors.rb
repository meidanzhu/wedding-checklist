class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :email
      t.string :category
      t.integer :bride_id
    end
  end
end
