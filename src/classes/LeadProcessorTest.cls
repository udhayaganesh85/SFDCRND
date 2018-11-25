@isTest
public class LeadProcessorTest{

    testMethod  static void testDate()
    {
        List<Lead> lst = new List<Lead>();
        
        for(integer i=0;i<200;i++)
        {
          Lead ld = new Lead();
          ld.LastName ='test';
          ld.company ='test';
          lst.add(ld);  
        }
        insert lst;
        
        
        
        Test.startTest();
        LeadProcessor  uca = new LeadProcessor ();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead]);
        
        
        }
     }