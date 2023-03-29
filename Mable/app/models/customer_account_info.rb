class CustomerAccountInfo
    attr_accessor :acc_num, :balance

    def initialize(acc_num, balance)
        @acc_num = acc_num
        @balance = balance
    end
end
