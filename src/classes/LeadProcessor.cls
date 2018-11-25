global class LeadProcessor implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID  FROM lead' );
    }

    global void execute(Database.BatchableContext bc, List<lead> scope){
        // process each batch of records
        List<lead> leadrec = new List<lead>();
        for (lead l : scope) {
                l.LeadSource ='Dreamforce';
                leadrec.add(l);
               }
        
        update leadrec;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug( ' records processed. Shazam!');
      }   

}