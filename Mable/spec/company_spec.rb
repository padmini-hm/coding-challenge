require_relative "../app/models/company"
require_relative "../app/models/customer_account_info"

describe "Company", :company do
    it "should be initialized with comapny name and customer info with account number and balance" do
      properties = {account_number: "1111234522226789", balance: 5000.00}
      p properties
      customer_account_info = CustomerAccountInfo.new(properties)
      p customer_account_info
      p Company
      company = Company.new(company_name: "Alpha", customer_account_info: customer_account_info)
      p comapny
      expect(company).to be_a(Company)
    end

    it "receives the customer_account_info attribute, which is an instance of CustomerAccountInfo" do
        properties = { customer_account_info: CustomerAccountInfo.new({account_number: "1111234522226789", balance: 5000.00})}
        company = Company.new(properties)
        expect(company.instance_variable_get(:@customer_account_info)).to be_a(CustomerAccountInfo)
      end
  end