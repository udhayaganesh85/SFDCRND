public class AnimalLocator
{

  public static String getAnimalNameById(Integer id)
   {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse resp = http.send(request);
        
     String strResp = '';
      if (resp.getStatusCode() == 200) {
      
      Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(resp.getBody());
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');

        strResp = (String)animal.get('name');

            
      }
      return strResp ;
      
   }



}