require_relative 'customer_account_info'
class Company
    attr_accessor :customer_account_info
    attr_reader :company_name

    def initialize(company_name, customer_account_info)
        @company_name = company_name
        @customer_account_info = customer_account_info
    end
end