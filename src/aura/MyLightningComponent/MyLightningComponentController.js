({ 

    doInit1 : function(component, event, helper) { 

        var action = component.get("c.getContacts"); 
console.log(action)
         

        action.setCallback(this, function(response){ 

            component.set("v.rec", response.getReturnValue()); 
console.log( response.getReturnValue());
        }); 

     $A.enqueueAction(action); 

    } 

})