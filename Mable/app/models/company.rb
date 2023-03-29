require_relative 'customer_account_info'
class Company
    attr_accessor  :company_name, :customer_account_info

    def initialize(company_name, customer_account_info)
        @company_name = company_name 
        @customer_account_info = customer_account_info
    end
end