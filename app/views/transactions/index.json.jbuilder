json.set! :data do
  json.array! @transactions do |transaction|
    json.user "#{transaction.user.name}"
    json.money "#{strip_trailing_zero(transaction.money)}"
    json.description "#{transaction.description}"
    json.date "#{transaction.date}"
    json.budget "#{transaction.budget.name}"
    json.url "#{link_to "<i class='material-icons'>edit</i>".html_safe, edit_transaction_path(transaction)} #{link_to "<i class='material-icons'>delete</i>".html_safe, transaction, method: :delete, data: { confirm: 'בטוח/ה?' }}"
  end
end
