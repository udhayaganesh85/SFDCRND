@RestResource(UrlMapping='/getAstroDetails/*')
global class AstroDetails{
   global class Request{
       public String name;
       public String city;
       public String tob;       
       public String dob;   
   } 
   global class Response{
        public boolean success;
        public String message; 
   }
    @HttpPOST
    global static Response getAstroDetails(Request request){     
        Response resp = new Response();
        String strEndPoint='http://stellarastrology.in/api/v1/horoscope';
        try{
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(strEndPoint);
        req.setMethod('POST');
        req.setHeader('Accept-Language','en-US');
        req.setHeader('content-type', 'application/json'); 
        req.setHeader('accept','application/json');
        req.setTimeout(120000);
        JSONGenerator gen = JSON.createGenerator(true);
        String sRequestXML = generateJSONContent(request.name,request.city,request.tob,request.dob);
        if(sRequestXML == null)
        {
            resp.success=false;
            resp.message='Please correct the input';
        }
        else
        {
            req.setBody(sRequestXML);
            res = http.send(req);
            //String removedPayload = res.getBody();
        }
    
        if(res.getBody() != null)
        {
            resp.success=true;
            resp.message=res.getBody();
        }       
        }catch(Exception e){
            resp.message = e.getMessage();
            System.debug('Exception: ' + e.getStackTraceString());
        }
        
        return resp;
    }
    
    public  static Map <String, Decimal> getLatLong(String city) {
        Map <String, Decimal> latlng = new         Map <String, Decimal>();
        String reqUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address='+city+'&key=AIzaSyCZnkgwsuvs6eaFcJSlN1ig2SrSVWyO_KI';
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        req.setEndpoint(reqUrl );
        req.setMethod('GET');
        req.setHeader('accept','application/json');
        req.setTimeout(120000);
        res = http.send(req);
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped( res.getBody());
        List<Object> pricing2 = (List<Object>) m.get('results'); //geometry
        for (Object o : pricing2) {
            Map<String, Object> p = (Map<String, Object>) o;
            for (String key : p.keySet())
            {    
                if(key == 'geometry')
                {    
                   Object obj = p.get('geometry'); 
                   Map<String, Object> p1 = (Map<String, Object>) obj;
                   for (String key1 : p1.keySet())
                    {
                        if(key1 == 'bounds')
                        {    
                           Object obj1 = p1.get('bounds');
                           
                           Map<String, Object> p2 = (Map<String, Object>) obj1;
                           for (String key2 : p2.keySet())
                           {
                              if(key2 == 'northeast') 
                              {
                                  Object obj2 = p2.get('northeast');
                                    system.debug('lat and long'+obj2 );
                                  Map<String, object> s = (Map<String, object> )obj2;
                                   latlng.put('lat',(decimal)s.get('lat'));
                                   latlng.put('lng',(decimal)s.get('lng'));  
                              }                               
                           }    
                                                  
                                                    
                        }
                    }
                   
                }        
            }
            
         }
         system.debug('lat and long ----->'+latlng );
     return latlng ;
    }
    
    //https://maps.googleapis.com/maps/api/geocode/json?address=chennai
    static String generateJSONContent(String name,String city,String tob,String dob) {
       Map <String, decimal> latLong = getLatLong(city);
       Decimal sLat = latLong.get('lat');
       Decimal sLng = latLong.get('lng');
         system.debug('@@@@'+sLat );
       system.debug('@@@@@'+sLng ); 
       String[] strLat = String.valueof(sLat).split('.');
       String[] strLng = String.valueof(sLng ).split('.');
       system.debug('@@@@'+strLat );
       system.debug('@@@@@'+strLng );       
       JSONGenerator gen = JSON.createGenerator(true);
        // Write data to the JSON string.
        gen.writeStartObject();
        gen.writeFieldName('birthDetails');
            gen.writeStartObject();
            gen.writeObjectField('personName', name);
            gen.writeObjectField('gender', 'male');
            
            
             
            gen.writeFieldName('birthPlace');
            gen.writeStartObject();
            gen.writeObjectField('city', city);
            gen.writeObjectField('state', '');
            gen.writeObjectField('country', '');
            gen.writeEndObject();
         
            
     
            gen.writeFieldName('latitude');
            gen.writeStartObject();
            gen.writeObjectField('degrees', strLat[0]);
            gen.writeObjectField('minutes', strLat[1]);
            gen.writeObjectField('seconds', '0');
            gen.writeObjectField('direction', 'NORTH');
            gen.writeEndObject();
            gen.writeFieldName('longitude');
            gen.writeStartObject();
            gen.writeObjectField('degrees', strLng[0]);
            gen.writeObjectField('minutes', strLng[1]);
            gen.writeObjectField('seconds', '0');
            gen.writeObjectField('direction', 'EAST');
            gen.writeEndObject();
            gen.writeStringField('timeZoneId', 'Asia/Kolkata');
           
            
       
             
            gen.writeFieldName('birthTime');
            gen.writeStartObject();
            gen.writeObjectField('year', city);
            gen.writeObjectField('month', city);
            gen.writeObjectField('day', city);
            gen.writeObjectField('hour', city);
            gen.writeObjectField('minutes', city);
            gen.writeObjectField('seconds', city);
            gen.writeEndObject();
          gen.writeEndObject();  
        
        
        // Get the JSON string.
        String pretty = gen.getAsString();
        system.debug('Input JSON:::::'+pretty);
        return pretty;
    }
    

}