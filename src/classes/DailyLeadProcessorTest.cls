@isTest
public class DailyLeadProcessorTest
{
     @isTest static void TestList()
     {
         List<lead> Teste = new List <lead>();
         for(Integer i=0;i<200;i++)
         {
             Teste.add(new lead(LastName='J',company='U'));
         }
         
         insert Teste;

          Test.startTest();
          String sch = '20 30 8 10 2 ?';
        // Schedule the test job
        String jobId = System.schedule('DailyLeadProcessor',sch,
             
            new DailyLeadProcessor());
                    Test.stopTest();
      }
 }