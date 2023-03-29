require_relative '../repositories/customer_account_repository'
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

    def update_balance
            @single_day_transactions_data.each do |transaction|
                record_with_from_account_number = @repo.find_record(transaction[:from_acc_num])
                record_with_from_account_number.balance -= transaction[:amount] if record_with_from_account_number.balance >= transaction[:amount]
                p record_with_from_account_number
                 puts"______________________________________"

                record_with_to_account_number =  @repo.find_record(transaction[:to_acc_num])
                record_with_to_account_number.balance += transaction[:amount]

                p record_with_to_account_number
            end
       @repo.all
       @repo.update_csv
    end

end