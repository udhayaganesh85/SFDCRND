({
 
doInit : function(component, event, helper) {
        var action = component.get('c.getAllContacts');
          action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
      component.set("v.contactRows",  response.getReturnValue());
            }
         });     $A.enqueueAction(action);
    } ,


    doSearch : function(component, event) {
        var searchTerm=component.get("v.term");
    	$A.get("e.c:SearchEvent").
     	setParams({term: searchTerm}).fire();}


})


/*({
doInit : function(component, event, helper) {
    var action = component.get('c:getAllContacts');
    action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
      component.set("v.contactRows",  response.getReturnValue());
            }
         });     $A.enqueueAction(action);

}
})*/