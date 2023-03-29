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
            account_number: row[0],
            balance: row[1].to_f
            }
            if (is_balance_negetive?(hash)) 
                puts "#{hash[:account_number]} has invalid Balance(#{hash[:balance]})" 
            else
                 is_account_number_valid?(hash)
            end
        end
    end

    def is_account_number_valid?(hash)
        if(hash[:account_number].length == 16 && hash[:account_number].match?(/^\d+$/))
            customer_acount_info = CustomerAccountInfo.new(hash)
            @repo << Company.new(@company_name, customer_acount_info)
        else
           puts "#{hash[:account_number]} is an invalid account number"
        end 
    end

    def is_balance_negetive?(hash)
        hash[:balance].negative?
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