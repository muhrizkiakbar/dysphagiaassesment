class ConfirmTransaction < ApplicationRecord
  belongs_to :tran, foreign_key: "transaction_id", class_name: "Transaction"
end
