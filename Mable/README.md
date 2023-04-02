# coding-challenge

ruby version - 3.0.0p0
RSpec 3.12

run: app.rb from Mable directory
run: rspec spec/* from Mable directory

Mable directory has app, data and spec directories


  1. app has models, controllers, repositories
  
    1. data has 2 csv 
      1. files mable_acc_balance.csv -> Contains customers account number and their balance information for a perticular comapny.
      2. mable_trans.csv -> Single day transactions between the customers of a perticular company.

    2. models has 
        1. Customer Account Information Model -> contains each customer's account information such as account number and balance. And a method #update_balance_with(amount) to update the balance for each transaction.
        Validations: Account number should be a 16 digit number. Balance should be a numerci value greater than or equal to zero. 
        Calculation: To update the balance with amount, both balance and amount are converted into cents. The updated balance is stored and displayed in terms of cents.
        Clarification: Not sure if we have to update the mable_acc_balance.csv file with the updated balance in dollars.
        
     3. repositories -> 
        1. contains information of all customers with their account number and balance. 
        2. This information is loaded from the csv file mable_acc_balance.csv
        3. Account number is assumed to be a 16 digit string.
        4. Balance is assumed to be a numeric value. Which has been later converted into cents for the calculation purpose.
        5. Has a method #find_by(account_number) to find the customer information based on their account number.
        6. method #all displays all customers information with their account number and current balance.
        7. #save_csv method rewrites mable_acc_balance.csv file with the updated blance after the transaction. As of now I have commented this method, not sure if it part of the requirement.
        
      4. Controllers -> 
        1. Controller loads the single day transaction file mable_trans.csv 
        2. Check if the customers already exists, by comapring their account number from customer repository.
        3. The transaction will happen only if both the customers(from and to) exists in the customer database(repo).
        4. Transaction happens only if the customer has enough balance to transfer the amount.
        5. #display_transaction_information method displays the transaction information written in view.
        6. For the privacy reason, its good to create a private method in the CustomerAccountInfo model, to update the balance.
        
      5. Views ->
        1. Displays customer transaction information.

     5.spec -> 
     
      1. customer_account_info_spec.rb - Validates account number and balance.
      2. customer_repository_spec.rb - checks the condition to retrieve customer record from repo by using find_by(account_number) method.
      3.customers_account_controller_spec.rb - checks if the customers exists in the data base before the transaction and updates the balance accordingly.

        
    6. Future Work

      1.Put validations if the file exists before loading the csv.
      2.Handle balance updation by creating a private method in customr_account_information model.
      3.Create private methods to validate account number and balance, and handle the error.
      4.Add more test cases in rspec.
     
        
  
    
 
