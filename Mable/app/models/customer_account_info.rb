class CustomerAccountInfo
    attr_reader  :account_number, :balance

    def initialize(attributes = {})
    
        @account_number = attributes[:account_number] if attributes[:account_number].length == 16 && attributes[:account_number].match(/^\d+$/)
        
        @balance = attributes[:balance] if !attributes[:balance].negative?
            
        #  @balance = convert_dollar_to_cent(attributes[:balance])    
    end


    # def convert_dollar_to_cent(balance)
    #     (balance.to_f * 100).to_i
    # end

    def transaction(amount)
         @balance += amount
        #  p "amount=#{amount} balance=#{@balance} acc_num #{@account_number}"
        
    end
end
