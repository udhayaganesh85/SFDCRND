global class MyWebService {
  
  global class AccountInfo {
     webservice String AcctName;
     webservice Integer AcctNumber;
  }

  webservice static Account createAccount(AccountInfo info) {
    Account acct = new Account();
    acct.Name = info.AcctName;
    acct.AccountNumber = String.valueOf(info.AcctNumber);
    insert acct;
    return acct;
  }
  }