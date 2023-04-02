require_relative '../app/controllers/customers_account_controller'
require_relative '../app/models/customer_account_info'
require_relative "support/csv_helper"


describe "CustomerAccountController", :customer_account_repository do
    let(:customer_account_info) do
      [
        ["1111234522226789", 5000.00],
        ["1111234522221234", 10000.00],
        ["2222123433331212", 550.00],
        ["1212343433335665", 1200.00],
        ["3212343433335755", 50000.00],
        ["3212343433335", 50000.00],
        ["3212343433335711", -50000.00],
        ["3212343433335722", 100.00]
      ]
    end
      let(:single_day_transactions_data) do
    [
        ["1111234522226789","1212343433335665",500.00],
        ["3212343433335755","2222123433331212",1000.00],
        ["3212343433335755","1111234522226789",320.50],
        ["1111234522221234","1212343433335665",25.60],
        ["1111111111111111","1212343433335665",25.60],
        ["3212343433335722", "1111234522226789", 200.00],
    ]
    end

    let(:csv_path) { "spec/support/customer_account_info.csv" }
    let(:csv_path_for_day_transaction) { "spec/support/single_day_transactions_data.csv" }
    let(:repository) {CustomerRepository.new(csv_path)}

    before(:each) do
        CsvHelper.write_csv(csv_path, customer_account_info)
        CsvHelper.write_csv(csv_path_for_day_transaction, single_day_transactions_data)
    end

    describe "#initialize" do
        it "should take two arguments: the CSV file path for day transaction and instace of Customer repository" do
          expect(CustomerAccountController.instance_method(:initialize).arity).to eq(2)
        end
    
        it "should be initialized with a `CustomerRepository` instance and a csv file path for day transaction" do
            controller = CustomerAccountController.new(csv_path_for_day_transaction, repository)
            expect(controller).to be_a(CustomerAccountController)
        end
    end

    describe "#transaction" do

        it "Should check if the customer A and customer B are already existing customers" do
            customer_account_controller = CustomerAccountController.new(csv_path_for_day_transaction, repository)
            customerA = customer_account_controller.is_account_number_exists?("1111234522226789")
            customerB = customer_account_controller.is_account_number_exists?("1212343433335665")
            expect(customerA).not_to be_nil
            expect(customerB).not_to be_nil
         end

        it "Should transfer amount from customer A to customer B if customerA has enough balance" do
            single_day_transactions_data= {:from_acc_num=>"1111234522226789", :to_acc_num=>"1212343433335665", :amount=>50000} 
            customer_from_acc_num = repository.find_by("1111234522226789")
            
            customer_to_acc_num = repository.find_by("1212343433335665")
            condition = customer_from_acc_num.balance >= single_day_transactions_data[:amount]
            expect(condition).to be(true)
            customer_from_acc_num_balance = customer_from_acc_num.update_balance_with(-single_day_transactions_data[:amount])
            customer_to_acc_num_balance = customer_to_acc_num.update_balance_with(single_day_transactions_data[:amount])
            expect(customer_from_acc_num_balance).to eq(450000)
            expect(customer_to_acc_num_balance).to eq(170000)
        end

        it "Should not transfer amount from customer A to customer B if customerA has balance less than amount" do
            single_day_transactions_data= {:from_acc_num=>"3212343433335733", :to_acc_num=>"3212343433335700", :amount=>20000} 
            
            customer_from_acc_num = CustomerAccountInfo.new({:account_number => "3212343433335722", :balance => 100.00})
            
            customer_to_acc_num = CustomerAccountInfo.new({:account_number => "3212343433335700", :balance => 100.00})
            condition = customer_from_acc_num.balance >= single_day_transactions_data[:amount]
            expect(condition).to be(false)
        end
    end
end
    