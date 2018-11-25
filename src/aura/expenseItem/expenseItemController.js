({
    clickCreate: function(component, event, helper) {
        var validExpense = true;
        /*var validExpense = component.find('expenseform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid(); return validSoFar && inputCmp.get('v.validity').valid;
        }, true); */
        if(validExpense){
             helper.createExpense(component);
        }
    }
})