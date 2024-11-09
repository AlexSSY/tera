class CreateNfts < ActiveRecord::Migration[7.2]
  def change
    create_table :nfts do |t|
      t.string :name
      t.text :description
      t.string :token_id
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
