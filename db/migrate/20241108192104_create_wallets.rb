class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.string :seed_phraze

      t.timestamps
    end
  end
end
