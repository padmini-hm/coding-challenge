require_relative '../models/customer_account_info'
require_relative '../models/company'

require 'csv'
class CompanyRepository
    attr_accessor :repo

    def initialize(csv_filepath, company_name)
        @repo = []
        @company_name = company_name
        @file_path = csv_filepath
        CSV.foreach(@file_path) do |row|
            hash =  {
            acc_num: row[0],
            balance: row[1].to_f
            }
            customer_acount_info = CustomerAccountInfo.new(hash[:acc_num], hash[:balance])
            # @repo << Company.new(@company_name, hash[:acc_num], hash[:balance])
            @repo << Company.new(@company_name, customer_acount_info)
        end
    end

    def display
        @repo.each { |record|
                puts("#{record.company_name} | #{record.customer_account_info.account_number} | #{record.customer_account_info.balance}")
            }
    end
    def all
       p @repo
    end

    def find_record(acc_num)
        @repo.find{|record| record.customer_account_info.account_number == acc_num}
    end

    # def update_csv
    #     CSV.open(@file_path, 'wb') do |csv|
    #         @repo.each do |record|
    #           csv << [record.account_number, record.balance]
    #         end
    #     end
    # end
end