class AdUserReferencesToWallets < ActiveRecord::Migration[7.2]
  def change
    add_column :wallets, :user_id, :integer
    add_foreign_key :wallets, :users, column: :user_id
  end
end
