public class RandomContactFactory{
    public static List<contact> generateRandomContacts(Integer no,String name)
    {
       List<contact> lsC = new List<contact>(); 
        for(integer i=0;i<no;i++)
        {
            Contact  c = new Contact(lastname=name+i,firstname=name+i);
            lsC.add(c);
        }        
    return lsC;
    
    }
    
}