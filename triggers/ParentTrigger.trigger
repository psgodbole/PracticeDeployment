trigger ParentTrigger on Parent__c (after  insert,after update,after unDelete) {
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            if(Parent_Trigger_Handler.isrecursive){
                 Parent_Trigger_Handler.isrecursive=false;
                Parent_Trigger_Handler.after_Parent_created_create_Duplicate_parent(trigger.new);
               
            }
           
        }
        if(trigger.isUpdate){
          // Parent_Trigger_Handler.creating_Child_on_Parent(trigger.new);
          Parent_Trigger_Handler.creating_child_According_to_NoofLocations(trigger.new,trigger.oldMap);
        }
        if(trigger.isUndelete){
            Parent_Trigger_Handler.after_Undelete_Send_Email(trigger.new);
        }
        
    }
    
}