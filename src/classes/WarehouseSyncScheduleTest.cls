@isTest
public class WarehouseSyncScheduleTest {
    public static String CRON_EXP = '0 0 1 ? * * *';
    @isTest static void testScheduledJob (){
        Test.startTest();
        String jobId = System.schedule('WarehouseSyncScheduleTest', CRON_EXP, new WarehouseSyncSchedule());
        Test.stopTest();
    }

}