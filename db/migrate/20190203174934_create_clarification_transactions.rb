class CreateClarificationTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :clarification_transactions do |t|
      t.bigint :transaction_id
      t.string :clarification

      t.timestamps
    end
    add_foreign_key :clarification_transactions, :transactions, on_delete: :cascade 
  end
end
