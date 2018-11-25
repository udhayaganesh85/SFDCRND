public with sharing class myController {
    public string firstName {get;set;}
    public Account account { get; set; }
    public myController()
    {
     if(ApexPages.currentPage().getParameters().get('id') != null)
     account =[select id,name from account where id =: ApexPages.currentPage().getParameters().get('id')];
     else
     account = new Account();
    }
    public PageReference save() {
        if(firstName !=null)
        account.name =firstName;
        upsert account;
        return null;
    }

}