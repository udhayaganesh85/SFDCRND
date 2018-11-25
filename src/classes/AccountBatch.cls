global class AccountBatch implements Database.Batchable<sObject>
{
String par;
AccountBatch(String param)
{
    par = param;
}
 global Database.QueryLocator start(Database.BatchableContext bc){
 return  Database.getQueryLocator('select id,name from Account limit 100');
 }
 global void execute(Database.BatchableContext BC, List<Account> scope){
 for(Account a: scope)
 {    
     a.phone ='1234';
 }
 update scope;
 }
 global void finish(Database.BatchableContext bc){}
}