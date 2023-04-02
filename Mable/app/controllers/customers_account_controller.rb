require_relative '../repositories/customer_repository'
require_relative '../models/customer_account_info'
require_relative '../views/customer_view.rb'
require 'csv'

class CustomersAccountController
    def  initialize(csv_filepath, repo)

        @single_day_transactions_data = []
        @repo = repo
        @file_path = csv_filepath
        @view = CustomerView.new
        load_single_day_transaction_data(@file_path)
    end

    def transaction
        @single_day_transactions_data.each do |data|
            debit_record =  is_account_number_exists?(data[:from_acc_num])
            
            credit_record = is_account_number_exists?(data[:to_acc_num])
            
                if(!debit_record.nil? && !credit_record.nil? && debit_record.balance >= data[:amount]) 
                    debit_record.update_balance_with(-data[:amount]) 
                    credit_record.update_balance_with(data[:amount])
                    @view.display_transaction_information(debit_record, credit_record, data[:amount])
                end
        end
        # @repo.all
        # @repo.save_csv
    end

    def is_account_number_exists?(account_number)
        @repo.find_by(account_number)
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


