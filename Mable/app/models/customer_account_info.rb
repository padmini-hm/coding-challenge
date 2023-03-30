class CustomerAccountInfo
    attr_reader  :account_number, :balance

    def initialize(attributes = {})
    
        if attributes[:account_number].length == 16 && attributes[:account_number].match(/^\d+$/)
            @account_number = attributes[:account_number]
        else
            puts ("Invalid account number #{attributes[:account_number]}")
        end

        if !attributes[:balance].negative?
            @balance = attributes[:balance]
            #  @balance = convert_dollar_to_cent(attributes[:balance])    
        else
            puts ("Invalid balance #{attributes[:balance]}")
        end
    end


    # def convert_dollar_to_cent(balance)
    #     (balance.to_f * 100).to_i
    # end

    def transaction(amount)
        
        @balance += amount
         p "amount=#{amount} balance=#{@balance} acc_num #{@account_number}"
        
    end
end
