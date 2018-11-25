public class AccountProcessor
{
    @future
    public static void countContacts(List<id> accID)
    {
       List<Account> listUpdate = new List<Account>();
       
      List<Account> acc = [select id,Number_of_Contacts__c , (select id from contacts) from account where id in :accID]; 
        system.debug(accID+'$$$$$$$'+ acc);
       for(account a:acc)
       {
          
         Integer size =a.contacts.size();
         a.Number_of_Contacts__c = size;
           
        
         listUpdate.add(a);
       }  
       if(listUpdate.size()>0)
       update listUpdate;   
       
    }
}