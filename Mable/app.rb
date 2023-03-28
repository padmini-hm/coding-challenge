require_relative 'app/company_model'
require_relative 'app/company_repo'
require_relative 'app/company_controller'

repo = CompanyRepo.new("data/mable_acc_balance.csv")
controller = CompanyController.new("data/mable_trans.csv", repo)
controller.check
