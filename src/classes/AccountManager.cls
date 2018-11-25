@RestResource(urlMapping='/Account/*/contacts')
global with sharing class AccountManager
{
 @httpget
 global static Account getAccount()
 {
     RestRequest request = RestContext.request;
     system.debug('#############'+request.requestURI);
     

     String AccId = request.requestURI.substringBetween('Accounts/','/contacts');

     system.debug('########'+AccId);
     Account result =  [SELECT id,name ,(select id from contacts) from account where id =: AccId];
     return result;

 }
}