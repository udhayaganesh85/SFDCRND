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


/* <form class="slds-form--stacked">     
        <lightning:card >
            <lightning:input aura:id="quoteform" label="quote Name"
                             name="quotename"
                             value="{!v.quote.Name}"
                             required="true"/> 
            <lightning:input  type="email" aura:id="quoteform" label="Customer Email"
                             name="quoteemail"
                             value="{!v.quote.customerEmail__c}"
                             required="true"/> 

        <lightning:input aura:id="quoteform" label="Equipment"
                             name="quoteclient"
                             value="{!v.quote.equipment__c}"
                             placeholder="ABC Co."/> 

            <lightning:button label="Save quote" 
                              class="slds-m-top--medium"
                              variant="brand"
                              
                              onclick="{!c.clickCreate}"/>
        </lightning:card>
     </form>*/