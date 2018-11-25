trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    for(Account a : Trigger.New) {
        if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
            oppList.add(new Opportunity(Name=a.Name + ' Opportunity',StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),AccountId=a.Id));
        }           
    }
        insert oppList;
}

/*trigger AccTrigger on Account (before update) {
 List<Contact> contactsToUpdate = new List<Contact>{};
 for(Account a:trigger.new) 
     a.NumberOfEmployees= 1; //trigger should have before update
 List<Account> acc= [select id,name, (select id from contacts) from account where id in :Trigger.newMap.keyset()];
 for(Account a:acc)
 {
   for(Contact con:a.contacts)
   {
       con.Languages__c ='English';
       contactsToUpdate.add(con);
   }
 }
 update contactsToUpdate ;
}*/