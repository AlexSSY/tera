class ChangeWalletsSeedPhrazeToSeedPhrase < ActiveRecord::Migration[7.2]
  def change
    rename_column :wallets, :seed_phraze, :seed_phrase
  end
end
