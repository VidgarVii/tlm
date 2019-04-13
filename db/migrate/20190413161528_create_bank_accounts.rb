class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.decimal :settlement_account, precision: 20
      t.integer :bank_id, foreign_key: true, null: false
      t.integer :company_id, foreign_key: true, null: false

      t.timestamps
    end

    add_index :bank_accounts, :bank_id
    add_index :bank_accounts, :company_id
  end
end
