({
	     doInit : function(component, event, helper) { 
        helper.callServer(
            component, 
            "c.getPhone", 
            function(response) { 
                component.set('v.contactPhone',response); 
            }, 
            { contactId: component.get('v.recordId')  } 
        ); 
    },
     doCancel : function(component, event, helper) { 
         console.log('Button Name==='+event.getSource().get("v.label"));
         component.set("v.message","You Clicked "+event.getSource().get("v.label"));
	},
    searched : function(component, event) {
    var searchedTerm=event.getParam("term");
    component.set('v.message','You searched for the term [' + searchedTerm + '] ' +' I might find some matching records');
}
})