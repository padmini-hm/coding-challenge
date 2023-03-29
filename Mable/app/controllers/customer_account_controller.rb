# require_relative '../repositories/customer_account_repository'
require_relative '../repositories/company_repository'
require_relative '../models/customer_account_info'
require 'csv'
class CustomerAccountController
    def  initialize(csv_filepath, repo)

        @single_day_transactions_data = []
        @repo = repo
        @file_path = csv_filepath
        
        CSV.foreach(@file_path) do |row|
            hash =  {
            from_acc_num: row[0],
            to_acc_num: row[1],
            amount: row[2].to_f
            }
            @single_day_transactions_data << hash
        end
    end

    def check_account_number_update_balance
            @single_day_transactions_data.each do |data|

                 check_if_the_account_number_exists?(data[:from_acc_num], data[:amount], "debit")
                 
                 check_if_the_account_number_exists?(data[:to_acc_num], data[:amount], "credit")          
            end
            @repo.display
    #    @repo.update_csv
    end

    def check_if_the_account_number_exists?(account_number, amount, transaction_type)
        record_with_account_number = @repo.find_record(account_number)
        if (record_with_account_number != nil)
            update_balance(record_with_account_number, amount, transaction_type)
        else
            puts "#{account_number} doesn't exist"
        end
    end

    def update_balance(record, amount, transaction_type)
        if (record.customer_account_info.balance >= amount && transaction_type == "debit")
            record.customer_account_info.transaction(record.customer_account_info.account_number, -amount)
        elsif (transaction_type == "credit")
            record.customer_account_info.transaction(record.customer_account_info.account_number, amount) 
        else
            puts "#{record.customer_account_info.account_number} #{amount} #{transaction_type} Transaction not possible because of low balance"
        end

    end
end


