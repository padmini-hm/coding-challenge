class CustomerAccountInfo
    attr_accessor :balance
    attr_reader  :account_number

    def initialize(attributes = {})
        @account_number = attributes[:account_number]
        @balance = attributes[:balance]
    end

    def transaction(amount)
        @balance += amount
    end
end
