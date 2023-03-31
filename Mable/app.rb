require_relative 'app/controllers/customer_account_controller'

# company_name = "Alpha"  
repo = CustomerRepository.new("data/mable_acc_balance.csv")
controller = CustomerAccountController.new("data/mable_trans.csv", repo)
controller.transaction
