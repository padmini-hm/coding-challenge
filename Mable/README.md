# coding-challenge

ruby version - 3.0.0p0
RSpec 3.12

Go to Mable directory has app, data and spec directories


  1. app has models, controllers, repositories
  
    1. data has 2 csv 
      1. files mable_acc_balance.csv -> Contains customers account number and their balance information for a perticular comapny.
      2. mable_trans.csv -> Single day transactions between the customers of a perticular company.

    2. models has 
        1. Company Model -> To store the information of all the customers with their account number and balance, and the comapny name.
        2. Customer Account Information MOdel -> contains each customers information on their account number and balance. And a method to handle          update the balance for each transaction.
        Validations: Account number should be a 16 digit number. Balance should be a non negative float value. 
        Calculation: To update the balance based on transaction type and amount, both balance and amount are converted into cents.
        Clarification: Not sure if we have to update the mable_acc_balance.csv file with the updated balance in dollars.
        
     3. repositories -> 
        1. contains information of a company with its name, and information of all customers with account number and balance.
        2. This information is loaded from the csv file mable_acc_balance.csv
        3. Account number is assumed to be a string.
        4. Balance is assumed to be a float value. Which has been later converted into cents for the calsulation purpose.
        5. Has a method find to find the customer information based on their account number.
        6. method all, displays all customers information with their account number and current balance.
        7. Display method gives the same information as the method all but in a more readable format. Its not a good idea to write display method in repository as it should be handled by the Views. Since showing data is not under the requirement, I have set the low preority.
        8. save_csv method helps update the csv file with the recent updated balance after the transaction. As of now I have comecnted this method, not     sure if it part of the requirement.
        
      4. Controllers -> 
        1. Controller loads the single day transaction file mable_trans.csv 
        2. Check if they are genuine customers, by comapring their account number from company repository.
        3. The transaction will happen only if both the customers(from and to) exists in the comapny database(repo).
        4. Transaction happens only if the customer has enough balance to transfer the amount.
        5. Since there are two kinds of transaction is happening, I have used the name credit and debit. These name needs to handled more efficiently as of now I have just hard coded these values.
        6. For the privacy reason, the balance is updated only within the Custome Info model.
        
     5.spec -> 
     
      1. customer_account_info_spec.rb -
      2. company_spec.rb
        
     
        
  
    
 
