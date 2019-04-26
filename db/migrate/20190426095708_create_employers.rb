class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.integer          :post, null: false
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
