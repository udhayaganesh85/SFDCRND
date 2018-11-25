trigger AccountAddressTrigger on Account (before insert, before update) {
if(trigger.isBefore)
{
    List<account> l = [select id,ShippingPostalCode ,BillingPostalCode, Match_Billing_Address__c   from Account where id= :Trigger.new];
    system.debug(l);
   system.debug(trigger.new);
    for(Account a:l)
    {
        if(a.ShippingPostalCode == a.BillingPostalCode)
        {
            a.Match_Billing_Address__c = true;
        }
    }
}

}