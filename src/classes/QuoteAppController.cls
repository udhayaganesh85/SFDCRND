public class QuoteAppController {
 @AuraEnabled
    public static boolean saveRecord(QuoteDetail__c accountRecord) {
        try{
            system.debug('@apex save...' + accountRecord);
            upsert accountRecord;
            return true;
         }
         catch(Exception e){
              return false;
          }
    }
    
}