@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] result = ParkLocator.country('India');
        system.debug('################'+result);

    }
}