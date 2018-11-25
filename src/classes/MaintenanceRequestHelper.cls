public class MaintenanceRequestHelper {
    
    public void updateWorkOrders(Set<ID> caseIDs){
   
   List<Case> casesToInsert = new List<Case>();
      // try{
       for(case cs:[select id,Type, Date_Due__c,Equipment__c,(select id,Equipment__r.Maintenance_Cycle__c from Work_Parts__r ORDER BY Equipment__r.Maintenance_Cycle__c ASC ), 
       Vehicle__c from case where id in:caseIDs and (Type = 'Repair' OR Type = 'Routine Maintenance')])
       {
          Case newCase = new Case();
          newCase.Type='Routine Maintenance';
          newCase.Vehicle__c=cs.Vehicle__c;
          newCase.Equipment__c=cs.Equipment__c;
          newCase.Subject='Routine Maintenance Follow Up';
          newCase.Date_Reported__c=Date.Today();
          newCase.Status='New';
          newCase.Origin='Web';
          if(cs.Work_Parts__r!=null && cs.Work_Parts__r.size()>0)
          newCase.Date_Due__c=Date.today()+cs.Work_Parts__r[0].Equipment__r.Maintenance_Cycle__c.intValue();
          casesToInsert.add(newCase);

       }
       if(casesToInsert.size()>0)
       insert casesToInsert;
         
    }
}