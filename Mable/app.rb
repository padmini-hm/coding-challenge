# require_relative 'app/models/customer_account_info'
require_relative 'app/repositories/customer_account_repository'
require_relative 'app/controllers/customer_account_controller'


# repo = CustomerAccountRepository.new("data/mable_acc_balance.csv")
company_name = "Alpha"
repo = CompanyRepository.new("data/mable_acc_balance.csv", company_name)
controller = CustomerAccountController.new("data/mable_trans.csv", repo)
controller.check_account_number_update_balance
