class CreateConfirmTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :confirm_transactions do |t|
      t.bigint :transaction_id
      t.boolean :status

      t.timestamps
    end
   add_foreign_key :confirm_transactions, :transactions, on_delete: :cascade  
  end
end
