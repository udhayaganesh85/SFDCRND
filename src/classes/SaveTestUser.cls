public class SaveTestUser {
    
    @AuraEnabled 
    public static Test_User__c saveUser(String name, String password, String email, String caseStudy, String nickname) {  
    
        Test_User__c testUser = new Test_User__c(Name=name, Password__c=password, Email__c=email);

        upsert testUser;
        return testUser;
    }
    
     

}