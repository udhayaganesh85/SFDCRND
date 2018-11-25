({
	    // Load expenses from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        var name = component.get("v.expenseName");
		
        var action = component.get("c.getExpenses");
		console.log(action);
        // Add callback behavior for when response is received
         action.setParams({  filter : name  });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });

        // Send action off to be executed
        $A.enqueueAction(action);
    }   
     
})