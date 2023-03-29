require_relative "../app/models/customer_account_info"

describe "CustomerAccountInfo", :customer_account_info do
    it "should be initialized with a hash of properties" do
      properties = { account_number: "1111234522226789", balance: 5000.00}
      customer_account_info = CustomerAccountInfo.new(properties)
      expect(customer_account_info).to be_a(CustomerAccountInfo)
    end
  
    describe "#account_number" do
      it "should return the account number" do
        customer_account_info = CustomerAccountInfo.new({ account_number: "1111234522226789"})
        expect(customer_account_info.account_number).to eq("1111234522226789")
      end
    end
  
    describe "#balance" do
        it "should return the balance" do
          customer_account_info = CustomerAccountInfo.new({ balance: 5000.00})
          expect(customer_account_info.balance).to eq(5000.00)
        end
      end

      describe "#balance" do
        it "should set the balance" do
          customer_account_info = CustomerAccountInfo.new({ balance: 5000.00})
          customer_account_info.balance += 100.00 
          expect(customer_account_info.balance).to eq(5100.00)
        end
      end

    #   describe "#transaction" do

    #   end
  end