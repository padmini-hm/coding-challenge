class CustomerView
    def display_transaction_information(debit_record, credit_record, amount)   
        puts("An amount $#{conversion_from_cents_dollar(amount)} has been transferred from #{debit_record.account_number} to #{credit_record.account_number}")
        puts("#{debit_record.account_number} has balance $#{conversion_from_cents_dollar(debit_record.balance)}")
        puts("#{credit_record.account_number} has balance $#{conversion_from_cents_dollar(credit_record.balance)}")
        puts("\n")
    end

    def conversion_from_cents_dollar(money_in_cents)
        sprintf('%.2f', money_in_cents/100.0)
    end
end