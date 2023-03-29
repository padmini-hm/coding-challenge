class CustomerAccountInfo
    attr_accessor :account_number, :balance

    def initialize(acc_num, balance)
        @account_number = acc_num
        @balance = balance
    end

    def transaction(account_number, amount)
        @balance += amount
    end
end
