@isTest
global class ParkServiceMock   implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
           
       
        ParkService.byCountryResponse  responseO = new ParkService.byCountryResponse ();
        String[] s= new String[]{'a','b'};
        responseO.return_x=  s;
        response.put('response_x', responseO); 
       
   }
}