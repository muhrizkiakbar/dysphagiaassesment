json.extract! confirm_transaction, :id, :transaction_id, :status, :created_at, :updated_at
json.url confirm_transaction_url(confirm_transaction, format: :json)
