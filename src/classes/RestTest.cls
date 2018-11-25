public class RestTest {
    public String restTest { get; set; }

    public static String restTest() {
    system.debug('came here123');
    HTTPResponse oauth = oauthLogin('https://na17.salesforce.com',
            '3MVG9xOCXq4ID1uE78V4onU6arnbHWL5u8.RrpFgMM.sMNdM9itXslYi4NdHITFWf1RyWdsHYNccYJ8vxYbfq',
            '3078527245426329149',
            's.udhayaganesh@gmail.com',
            'motheruma85');

        JSONParser parser = JSON.createParser(oauth.getBody());
        String accessToken = null;        String instanceUrl = null; 
          while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'access_token')) {
                parser.nextToken();
                accessToken = parser.getText();
            }
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'instance_url')) {
                parser.nextToken();
                instanceUrl = parser.getText();
            }

        }
        
        
        
        String name ='udhay';
        System.debug('accessToken: '+accessToken);
        System.debug('instanceUrl :'+instanceUrl );  
        HttpRequest req = new HttpRequest(); 
        req.setMethod('GET');
        req.setEndpoint(instanceUrl+'/services/apexrest/rest_by_udai/myservice?name='+name);
        req.setHeader('Authorization', 'OAuth '+accessToken);
        //req.setHeader('content-type', 'text/xml'); 
        //req.setHeader('Content-Length','526');
        //req.setTimeout(120000);
        

        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
        return res.getBody();
    }
 private static HTTPResponse oauthLogin(String loginUri, String clientId,
        String clientSecret, String username, String password) {
        HttpRequest req = new HttpRequest(); 
        req.setMethod('POST');
        req.setEndpoint(loginUri+'/services/oauth2/token');
        req.setBody('grant_type=password' +
            '&client_id=' + clientId +
            '&client_secret=' + clientSecret +
            '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') +
            '&password=' + EncodingUtil.urlEncode(password, 'UTF-8'));
        system.debug('came here4');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('BODY: '+res.getBody());
        System.debug('STATUS:'+res.getStatus());
        System.debug('STATUS_CODE:'+res.getStatusCode());
         system.debug('came here173');
        return res;
    }
}