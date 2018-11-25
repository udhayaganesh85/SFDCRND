public with sharing class caseExt {
    public List<wrapperCaseCmt> wrapper{get;set;}
    public List<String> cmt{get;set;}
    public List<case> caseObj {get;set;}
    public caseExt(ApexPages.StandardController controller) {
     wrapper= new List<wrapperCaseCmt>();
      for(Case c: [select id,  CaseNumber   ,Status,Subject from case where LastModifiedBy.id = :UserInfo.getUserId()  order by CreatedDate limit 20])
       {
                wrapper.add(new wrapperCaseCmt(c));
            }
     }
 public pagereference saveCmt()
 {
     List<CaseComment> caseCmtlst = new List<CaseComment>();
     List<User> u = [select id from user where profile.UserLicense.Name = 'salesforce' and isactive = true and id =: userinfo.getUserId()];
     
     for(wrapperCaseCmt w:wrapper)
     {
         if(w.cmt!=null && !w.cmt.equals(''))
            {
                CaseComment caseCmtObj = new CaseComment();
                 caseCmtObj.ParentId =  w.wrpCaseObj.id;
                 caseCmtObj.CommentBody = w.cmt;
                 if(u.size() ==1)
                     caseCmtObj.IsPublished =  false;
                 
                  caseCmtlst.add(caseCmtObj);
            }
     }
     if(caseCmtlst.size() > 0)
       upsert caseCmtlst;
       
     ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM, caseCmtlst.size() + ' case comments successfully saved!'));
     return null;
 }
 class wrapperCaseCmt
 {
   /* public List<case> wrpCaseObj {get;set;}
    public List<String> cmt {get;set;}
    */
    public Case wrpCaseObj {get;set;}
    public String cmt {get;set;}
    wrapperCaseCmt(Case c)
    {   
        wrpCaseObj = c;
        cmt = '';
    }
 }
}