@isTest
private class TestAccount {

    @isTest static void TestAcc() {
         List<Account > contactsToUpdate = new List<Account >{};
        for(integer i=0;i<25;i++)
        {
         Account acct = new Account(Name='Test Account');
         contactsToUpdate.add(acct);
        }
        Test.startTest();
        List<Database.SaveResult> result= Database.insert(contactsToUpdate, false);
        Test.stopTest();
        }
}