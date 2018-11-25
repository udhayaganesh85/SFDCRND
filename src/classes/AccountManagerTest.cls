@IsTest
private class AccountManagerTest{

    @isTest static void testGetAccId() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://udhayaganeshs-dev-ed.my.salesforce.com/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisCase = AccountManager.getAccount();
    }

    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account a = new Account(name='TEST ME');
        insert a;
        Contact c= new contact(LastName='test');
        c.accountid=a.id;
        insert c;
        return a.Id;
    }          

}