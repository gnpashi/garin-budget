# json.array! @transactions, partial: "transactions/transaction", as: :transaction


json.set! :data do
  json.array! @transactions do |transaction|
    json.user "#{transaction.user.name}"
    json.money "#{transaction.money}"
    json.description "#{transaction.description}"
    json.date "#{transaction.date}"
    json.budget "#{transaction.budget.name}"
    json.url "#{link_to 'Edit', edit_transaction_path(transaction)}"
  end
end
