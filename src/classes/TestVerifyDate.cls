@isTest
public class TestVerifyDate{
    
    
    testMethod  static void testDate()
    {
        VerifyDate  v = new VerifyDate();
        Date d1 = date.today();
        Date d2 = date.today()+1;
                Date d3 = date.today()-45;
        VerifyDate.CheckDates(d1,d3);
        VerifyDate.CheckDates(d1,d2);
          
        
    }

}