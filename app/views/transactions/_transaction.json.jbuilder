json.extract! transaction, :id, :person, :money, :budget_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
