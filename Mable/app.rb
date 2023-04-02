require_relative 'app/controllers/customers_account_controller'

# company_name = "Alpha"  

repo = CustomerRepository.new("data/mable_acc_balance.csv")
controller = CustomersAccountController.new("data/mable_trans.csv", repo)
controller.transaction
