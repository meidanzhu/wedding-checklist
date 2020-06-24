class CreateBrides < ActiveRecord::Migration
  def change
    create_table :brides do |t|
      t.string :name
      t.string :email
      t.string :password_digest
    end
  end
end
