public with sharing class FirstController {

    public FirstController(ApexPages.StandardSetController controller) {
    if(controller.getRecord() != null)
this.opp =(Opportunity )controller.getRecord();
system.debug(this.opp);
if(this.opp!=null && this.opp.id !=null  )
        opp = [select id,name,stageName,closedate from opportunity where id =: this.opp.id];
    }

    public Opportunity opp {get;set;}
    
    public FirstController(ApexPages.StandardController controller) {
        this.opp =(Opportunity )controller.getRecord();
if(this.opp!=null && this.opp.id !=null)
        opp = [select id,name,stageName,closedate from opportunity where id =: this.opp.id];
    }
    
    public pagereference saveOpp()
    {
        upsert opp ;
        pagereference p= new pagereference('/apex/StdPage?id='+opp.id);
        p.setRedirect(true);
        return p;
        
    }

}