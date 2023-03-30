require_relative "../app/models/company"
require_relative "../app/models/customer_account_info"

describe "Company", :company do
    let(:customer_account_info) {CustomerAccountInfo.new(:account_number => "11112345222267", :balance => 5000.00)}
    let(:company) {Company.new(company_name: "Alpha", customer_account_info: customer_account_info)}

    it "should be initialized with a hash of properties" do
        properties1 = {company_name: "Alpha", customer_account_info: customer_account_info}
        company = Company.new(properties1)
        expect(company).to be_a(Company)
      end

    it "receives the customer_account_info attribute, which is an instance of CustomerAccountInfo" do
        properties = { customer_account_info: CustomerAccountInfo.new({account_number: "1111234522226789", balance: 5000.00})}
        company = Company.new(properties)
        expect(company.instance_variable_get(:@customer_account_info)).to be_a(CustomerAccountInfo)
    end

    
end