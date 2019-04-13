class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :type, default: "Trader", null: false
      t.bigint :inn, index: true, null: false
      t.bigint :kpp, null: false
      t.bigint :ogrn, null: false
      t.decimal :correspondent_account, precision: 20
      t.bigint :bik

      t.references :legal_form, foreign_key: true

      t.timestamps
    end
  end
end
