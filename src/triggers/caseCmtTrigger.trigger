trigger caseCmtTrigger on CaseComment (before insert, before update) {
    List<User> u = [select id from user where profile.UserLicense.Name = 'salesforce' and isactive = true and id =: userinfo.getUserId() limit 1];
    if(u.size() ==1)
     {
       for(CaseComment c : trigger.new)
       {
           c.IsPublished =  false;
                   
       }
}
}