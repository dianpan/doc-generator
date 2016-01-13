class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer :loan_amount, null: false
      t.integer :down_payment, null: false
      t.integer :interest_rate, null: false

      t.timestamps null: false
    end
  end
end
