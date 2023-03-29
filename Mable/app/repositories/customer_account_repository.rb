require_relative '../models/customer_account_info'

require 'csv'
class CustomerAccountRepository
    attr_accessor :repo

    def initialize(csv_filepath)
        @repo = []
        @file_path = csv_filepath
        CSV.foreach(@file_path) do |row|
            hash =  {
            acc_num: row[0],
            balance: row[1].to_f
            }
            @repo << CustomerAccountInfo.new(hash[:acc_num], hash[:balance])
        end
    end

    def all
       p @repo
    end

    def find_record(acc_num)
        @repo.find{|record| record.acc_num == acc_num}
    end

    def update_csv
        CSV.open(@file_path, 'wb') do |csv|
            @repo.each do |record|
              csv << [record.acc_num, record.balance]
            end
        end
    end
end