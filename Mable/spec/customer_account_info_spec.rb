require_relative "../app/models/customer_account_info"

describe "CustomerAccountInfo", :customer_account_info do
    let(:customer_account_info) {CustomerAccountInfo.new({account_number: "1111234522226789", balance: 100.00})}

    it "should be initialized with a hash of properties" do
        expect(customer_account_info).to be_a(CustomerAccountInfo)
    end
  
    it "should return the account number" do
        expect(customer_account_info.account_number).to eq("1111234522226789")
    end

    it "should return the balance" do
        expect(customer_account_info.balance).to eq(100.00)
    end
 
    # it "should set the balance only through the method transcation" do
    #     customer_account_info.balance += 100.00 
    #     expect(customer_account_info.balance).to eq(200.00)
    # end

    it "should let 16 digit account number" do
        expect(customer_account_info.account_number.length).to eq(16)   
    end

    it "should let only digits for account number" do
        expect(customer_account_info.account_number).to match(/^\d+$/)
    end

    it "should not accept the record if the account number is less than 16 digits" do
        customer_account_info = CustomerAccountInfo.new({:account_number => "1111", :balance => 100.00})
        expect(customer_account_info.account_number).to be_nil
    end

    it "should not accept the record if the account number is not 16 digits" do
        customer_account_info = CustomerAccountInfo.new({:account_number => "11112345222267891111", :balance => 100.00})
        expect(customer_account_info.account_number).to be_nil
    end
    
    it "should not accept the record if the account number contains other than digits" do
        customer_account_info = CustomerAccountInfo.new({:account_number => "1111asag@!#%^", :balance => 100.00})
        expect(customer_account_info.account_number).to be_nil
    end

    it "should let only positive values for balance" do
        customer_account_info = CustomerAccountInfo.new({:account_number => "1111234522226789", :balance => 100.00})
        expect(customer_account_info).to be_a(CustomerAccountInfo)
    end  

    it "should not accept negetive values for balance" do
        customer_account_info = CustomerAccountInfo.new({:account_number => "1111234522226789", :balance => -100.00})
        expect(customer_account_info.balance).to be_nil
    end  

end  
