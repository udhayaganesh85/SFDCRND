({
	createAccount : function(component, event, helper) {
                var theExpenses = component.get("v.AccountRecord.name");
 		var newExpense = JSON.parse(JSON.stringify(theExpenses));

        var action = component.get("c.saveAccRecord");
                action.setParams({
            "accountRecord": newExpense
        });
		component.set("v.status", 'true');

        $A.enqueueAction(action);
        
         
        
        
        	}
})