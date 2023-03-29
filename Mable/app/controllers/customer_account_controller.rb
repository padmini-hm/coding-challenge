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

                 debit_record = @repo.find_record(data[:from_acc_num])
                 credit_record = @repo.find_record(data[:to_acc_num])   

                 puts("Invalid #{data[:from_acc_num]}") if debit_record.nil?
                 puts("Invalid #{data[:to_acc_num]}") if credit_record.nil?

                 

                 if(debit_record.nil? && credit_record.nil?)      
                    update_balance(debit_record, data[:amount], "debit")
                    update_balance(credit_record, data[:amount], "credit")
                 else
                    puts "Invalid transaction from #{data[:from_acc_num]} to #{data[:to_acc_num]} as the account_number doesn't exist"
                 end
            end
            @repo.display
    #    @repo.update_csv
    end

    def update_balance(record, amount, transaction_type)
        if (record.customer_account_info.balance >= amount && transaction_type == "debit")
            record.customer_account_info.transaction(-amount)
        elsif (transaction_type == "credit")
            record.customer_account_info.transaction(amount) 
        else
            puts "#{record.customer_account_info.account_number} #{amount} #{transaction_type} Transaction not possible because of low balance"
        end

    end
end


