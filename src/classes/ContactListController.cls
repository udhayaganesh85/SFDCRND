public class ContactListController
{

@AuraEnabled
public static list<contact> getContacts(Id recordid){
 return [select id, name from contact where accountid =: recordid];
}

}