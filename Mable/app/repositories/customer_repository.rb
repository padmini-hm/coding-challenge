require_relative '../models/customer_account_info'
require 'csv'

class CustomerRepository
    attr_accessor :repo

    def initialize(csv_filepath)
        @repo = []
        @file_path = csv_filepath   
        load_csv(@file_path)
    end

    def display
        
        @repo.each { |record|
                puts("#{record.account_number} | #{record.balance}")
        }
    end

    def all
       p @repo
    end

    def find_by(account_number)
        @repo.find{|record| record.account_number == account_number}
    end

    def load_csv(file_path)
        CSV.foreach(@file_path) do |row|
            hash =  {
            account_number: row[0].to_s,
            balance: (row[1].to_f * 100).to_i
            }    
            customer_account_info = CustomerAccountInfo.new(hash)
            @repo << customer_account_info if !customer_account_info.account_number.nil? && !customer_account_info.balance.nil?
        end     
    end

    # def save_csv
    #     CSV.open(@file_path, 'wb') do |csv|
    #         @repo.each do |customer_record|
    #           csv << [customer_record.customer_account_info.account_number, sprintf('%.2f',customer_record.customer_account_info.balance/100.0)]
    #         end
    #     end
    # end
end