class CustomerAccountInfo
    attr_reader  :account_number, :balance

    def initialize(attributes = {})

        @account_number = attributes[:account_number]  if attributes[:account_number].match(/^\d+$/) && attributes[:account_number].length == 16
        @balance = attributes[:balance] if attributes[:balance].is_a?(Numeric) && attributes[:balance] >= 0
    end

    def update_balance_with(amount)
         @balance += amount
    end

    # private
    #     def validate_account_number(account_number)
    #       raise ArgumentError, "Invalid account number" unless account_number.match(/^\d+$/) && account_number.length == 16
    #     end

    #     def validate_balance(balance)
    #       raise ArgumentError, "Invalid balance" unless balance.is_a?(Numeric) && balance >= 0
    #     end
end
