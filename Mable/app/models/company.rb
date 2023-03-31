require_relative 'customer_account_info'
class Company
    attr_accessor :customer_account_info
    attr_reader :company_name

    def initialize(attributes = {})
        @company_name = attributes[:company_name] || "Alpha"
        @customer_account_info = attributes[:customer_account_info] 
    end
end