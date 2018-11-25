public class ContactDialButtonController {
    @AuraEnabled 
    public static String getPhone(Id contactId) {
		List<Contact> contact = [SELECT Phone from Contact where Id=:contactId];
    	return contact.get(0).Phone;
    }
    
    @AuraEnabled
	public static List<Contact> getAllContacts()
	{
		return [select id, name from Contact limit 5];    
	}
    
    @AuraEnabled
	public static Account getACC()
	{
		return [select id, name from Account limit 1];    
	}
    
    @AuraEnabled
    public static List<Expense__c> getExpenses(String filter) {
        return [SELECT Id, Name, Amount__c, Client__c, Date__c, 
                       Reimbursed__c, CreatedDate ,comments__c
                FROM Expense__c ];
    }
   @AuraEnabled
    public static boolean saveRecord(Expense__c accountRecord) {
        try{
            system.debug('@apex save...' + accountRecord);
            upsert accountRecord;
            return true;
         }
         catch(Exception e){
              return false;
          }
    }
   @AuraEnabled
    public static boolean saveAccRecord(String accountRecord) {
        try{
            system.debug('@apex save...' + accountRecord);
            Account a = new Account();
            a.name=accountRecord;
            insert a;
            return true;
         }
         catch(Exception e){
              return false;
          }
    }
   /* public static String getPhone() {
		List<Contact> contact = [SELECT Phone from Contact where phone <> null limit 1];
    	return contact.get(0).Phone;
    }*/
}