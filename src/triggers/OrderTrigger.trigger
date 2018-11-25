trigger OrderTrigger  on Opportunity (after update) {

 
    List<MyStatus__e > OrdEvents = New List<MyStatus__e >();
    for (Opportunity o: Trigger.new) {
        if(o.StageName == 'Prospecting' && Trigger.oldMap.get(o.Id).StageName <> 'Prospecting'){
           OrdEvents.add(new MyStatus__e(UdhayLocation__c = o.StageName ));
        }
    }
    if(OrdEvents.size()>0) EventBus.publish(OrdEvents);       
}