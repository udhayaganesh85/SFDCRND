global class CreateCaseFromContactController {

    // webservice keyword to expose to JavaScript
    // can only exist in global classes
    // must be static
    // ---------------------------------------------------------------
    
    webservice static String sayGreeting( String name ) {
        return 'Greetings, ' + name;
    }
     
     @AuraEnabled
    public static Contact getContact( ID contactId ) {
        
        System.debug( 'getting contact by id: ' + contactId );
        
        List<Contact> contacts = new List<Contact>([
            SELECT id, accountId FROM Contact WHERE id = :contactId
        ]);
        
        return ( contacts.size() > 0 ) ? contacts[0] : null;
    }
    
    @AuraEnabled
    public static Case saveCase( Case theCase ) {
        
        System.debug( 'upserting case: ' + theCase );
        
        try {

        	upsert theCase;
            return theCase;
            
        } catch ( Exception e ) {
            
            System.debug( LoggingLevel.ERROR, e.getMessage() + ' : ' + e.getStackTraceString() );
            throw e;
            
        }

    }
    
    // AuraEnabled annotation to expose to lightning components
    // can exist in global or public classes
    // must be static
    // ---------------------------------------------------------------

    @AuraEnabled
    public static String sayHello( ID leadId ) {
        Lead lead = [ SELECT name FROM Lead WHERE id = :leadId ];
        return 'Hello, ' + lead.name;
    }
    
}