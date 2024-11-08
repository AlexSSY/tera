class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :password_digest
      t.boolean :active

      t.timestamps
    end
  end
end
