require_relative '../repositories/company_repository'
require_relative '../models/customer_account_info'
require 'csv'
class CustomerAccountController
    def  initialize(csv_filepath, repo)

        @single_day_transactions_data = []
        @repo = repo
        @file_path = csv_filepath
        
        load_single_day_transaction_data(@file_path)
    end

    def check_account_number_update_balance
            @single_day_transactions_data.each do |data|

                 debit_record = @repo.find(data[:from_acc_num])
                 credit_record = @repo.find(data[:to_acc_num])   

                 puts("Account number #{data[:from_acc_num]} doesn't exist") if (debit_record.nil?)
                 puts("Account number #{data[:to_acc_num]} doesn't exist") if (credit_record.nil?)

                 

                 if(debit_record.nil? || credit_record.nil?)  
                    puts "Invalid transaction from #{data[:from_acc_num]} to #{data[:to_acc_num]} as the account_number doesn't exist"
                    break
                 else    
                    update_balance(debit_record, data[:amount], "debit")
                    update_balance(credit_record, data[:amount], "credit")
                 end
            end
            @repo.display
        # @repo.save_csv
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

    def load_single_day_transaction_data(file_path)
        CSV.foreach(file_path) do |row|
            hash =  {
            from_acc_num: row[0],
            to_acc_num: row[1],
            amount: (row[2].to_f * 100).to_i
            }
            @single_day_transactions_data << hash
        end
    end
end


