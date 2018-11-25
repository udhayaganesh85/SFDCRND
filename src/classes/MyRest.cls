@RestResource(urlMapping='/Account/*')
global with sharing class MyRest{
@HttpGet
@RestResource(urlMapping='/getAccount')
global static List<Account> getAccount()
{
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account limit 10];
        return result;

}
Global class MDTResponse {
    Webservice String responseCode;
    Webservice String responseMessage;
    Webservice String cmpgn_id;
    Webservice String[] offr_id;
    Webservice MDTErrorDetails[] errorDtls;
}

Global class MDTRequest {
    Webservice String cid;
    Webservice String mid;
    Webservice String oid;
}
Global class MDTErrorDetails {
    Webservice String errorcd;
    Webservice String errormsg;
}

public MyRest(){
//Make sure your Salesforce instance URL is added in remote site settings
String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm(); 
String restAPIURL = sfdcURL + '/services/data/v29.0/sobjects/';  
   
  
  
HttpRequest httpRequest = new HttpRequest();  
httpRequest.setMethod('GET');   
httpRequest.setEndpoint(restAPIURL);  
String response = '';
try {  
         Http http = new Http();   
         HttpResponse httpResponse = http.send(httpRequest);  
         if (httpResponse.getStatusCode() == 200 ) {  
               response = JSON.serializePretty( JSON.deserializeUntyped(httpResponse.getBody()) );  
         } else {  
               System.debug(' httpResponse ' + httpResponse.getBody() );  
               throw new CalloutException( httpResponse.getBody() );  
         }   
} catch( System.Exception e) {  
         System.debug('ERROR: '+ e);  
         throw e;  
}  
System.debug(' ** response ** : ' + response );  


}

}