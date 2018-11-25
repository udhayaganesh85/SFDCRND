public class AddPrimaryContact implements Queueable {
    private List<contact> conLst= new List<contact> ();
    private contact con;
    private String name;
    
    public AddPrimaryContact (Contact  records, String name) {
        this.con = records;
        this.name = name;
    }

    public void execute(QueueableContext context) {
        for (Account a : [SELECT Id, Name from Account where BillingState =: name limit 200])
        {
    Contact c = con.clone(false, false, false, false);
            //c.account.id = a.id;
            c.AccountId= a.id;
            conLst.add(c);
            //Account acCloneCopy = ac.clone(false, false, false, false);
 
        }
        insert conLst;
        }
    
}