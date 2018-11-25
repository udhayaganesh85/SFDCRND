({
    createExpense: function(component,event) {
        var theExpenses = component.get("v.expense");
 		var newExpense = JSON.parse(JSON.stringify(theExpenses));
        var action = component.get("c.saveRecord");
        action.setParams({
            "accountRecord": newExpense
        });
        //action.fire();
        /*action.setCallback(this, function(response) {
            var isSaved = response.getReturnValue();
            if (isSaved) {
                console.log('record saved '+isSaved+' and execution ends...');
            }
            else
                console.log('record saved false and execution ends...');
        });*/
       
        $A.enqueueAction(action); 
         
    var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    
    toastEvent.fire();
 
        
        /*theExpenses.push(newExpense);
        component.set("v.expense", theExpenses);        */
    }
})