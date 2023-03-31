require_relative "../app/repositories/company_repository"
require_relative "support/csv_helper"
# describe "CompanyRepository", :company_repository do
#     let(:customer_account_info) {CustomerAccountInfo.new(:account_number => "11112345222267", :balance => 5000.00)}
#     let(:company) {Company.new(company_name: "Alpha", customer_account_info: customer_account_info)}

#     let(:repo) {CompanyRepository.new}

#     describe '#find_by_account_number' do
#         it 'returns the customer record with the specified account number' do
#           customer_record = repo.find_by(customer_account_info.account_number)
#           expect(customer_record.account_number).to eq("11112345222267")
#         end
#       end
# end


describe "CompanyRepository", :company_repository do
    let(:customer_account_info) do
      [
        ["1111234522226789", 5000.00],
        ["1111234522221234", 10000.00],
        ["2222123433331212", 550.00],
        ["1212343433335665", 1200.00],
        ["3212343433335755", 50000.00],
        ["3212343433335", 50000.00],
        ["3212343433335711", -50000.00]
      ]
    end
    let(:csv_path) { "spec/support/customer_account_info.csv" }
  
    before(:each) do
      CsvHelper.write_csv(csv_path, customer_account_info)
    end

describe "#find" do
    it "should retrieve a specific customer info based on its account number" do
        
      repo = CompanyRepository.new(csv_path, "Alpha")
    
        customer = repo.find_by("1111234522221234")
        
        expect(customer.customer_account_info.account_number).to eq("1111234522221234")
        expect(customer.customer_account_info.balance).to eq(1000000)
    end
  end

  describe "#all" do
    it "should return all the customers stored by the repo" do
      repo = CompanyRepository.new(csv_path, "Alpha")
    
        customer = repo.find_by("1111234522221234")
        
        expect(repo.all).to be_a(Array)
        # p repo.all[0].customer_account_info.account_number
        expect(repo.all[0].customer_account_info.account_number).to eq("1111234522226789")
    end
  end

#   describe "#all" do
#     it "should return all the meals stored by the repo" do
#       repo = MealRepository.new(csv_path)
#       expect(repo.all).to be_a(Array)
#       expect(repo.all[0].name).to eq("Margherita")
#     end
end