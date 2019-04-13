class CreateLegalForms < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_forms do |t|
      t.string :less_title, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
