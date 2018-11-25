@isTest
private class WarehouseCalloutServiceTest {
  // implement your mock callout test here
    @isTest static void runWarehouseEquipmentSyncTest(){
        Product2 newPrd = new Product2();
        newPrd.Replacement_Part__c = True;
        newPrd.Cost__c=1000;
        newPrd.Current_Inventory__c =25;
        newPrd.Lifespan_Months__c=10;
        newPrd.Maintenance_Cycle__c=100;
        newPrd.Warehouse_SKU__c='12';
        newPrd.Name='Test';
        insert newPrd;        
        Test.startTest();
        Test.setMock(HttpCallOutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        System.assertEquals(2, [SELECT count() FROM Product2]); 
        
    }
}