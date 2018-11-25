public with sharing class donationUtil {

    public donationUtil(ApexPages.StandardController controller) {

    }
    public List <Donation__c> getDonationView() {
        List <Donation__c> donList=[select id, name ,amount__c,enteredon__c,personaddress__c,PersonName__c,personwishes__c from donation__c where PersonName__c <> '' order by enteredon__c desc limit 10];
         return donList;
     }
      public List <Expense__c> getExpView() {
        List <Expense__c> donList=[select id, Amount__c,Client__c,comments__c,Date__c,Name from Expense__c limit 10];
         return donList;
     }
}