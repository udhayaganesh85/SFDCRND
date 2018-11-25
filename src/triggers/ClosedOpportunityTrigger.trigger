trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
List<Task > listT= new List<task>();

for(Opportunity o: Trigger.new)
{
    if(o.stageName == 'Closed Won')
    {
        Task t = new Task();
        t.subject = 'Follow Up Test Task';
        t.WhatId = o.id;
        listT.add(t);
    }
}
insert listT;
}