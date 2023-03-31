require_relative "../app/repositories/customer_repository"
require_relative "support/csv_helper"


describe "CustomerRepository", :customer_repository do
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

  describe "#initialize" do
    it "should take one argument: the CSV file path to store customer information" do
      expect(CustomerRepository.instance_method(:initialize).arity).to eq(1)
    end
  end

  describe "#find" do
      it "should retrieve a specific customer info based on its account number" do   
        repo = CustomerRepository.new(csv_path)
        customer = repo.find_by("1111234522221234")
        expect(customer.account_number).to eq("1111234522221234")
        expect(customer.balance).to eq(1000000)
      end
    end

  describe "#all" do
    it "should return all the customers stored by the repo" do
      repo = CustomerRepository.new(csv_path)
        expect(repo.all).to be_a(Array)
    end
  end
end