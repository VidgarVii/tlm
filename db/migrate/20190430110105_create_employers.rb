class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :post
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
