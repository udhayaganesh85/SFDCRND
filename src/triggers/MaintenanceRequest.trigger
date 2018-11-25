trigger MaintenanceRequest on Case (after update) {
   MaintenanceRequestHelper mrh= new MaintenanceRequestHelper();
     Set<ID> caseIDs=trigger.newMap.keySet();
     mrh.updateWorkOrders(caseIDs);
 }