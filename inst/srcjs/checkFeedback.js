(function() {
  
  var store = {
    // cache the state for each feedback
    isShown: {},
              
    add: function(feedbackId) {
      if (this.isShown[feedbackId] === undefined) {
         this.isShown[feedbackId] = false;
      }
    },
  
    toggle: function(feedbackId) {
      this.isShown[feedbackId] = !this.isShown[feedbackId];
    }
  };
               
  Shiny.addCustomMessageHandler(
    "checkFeedback",
    function(message) {
    
      var $input = $("#" + message.inputId);
      var $label = $input.siblings("label");
      var $formGroup = $input.parent();
    
      // add feedbackId to the store
      store.add(message.feedbackId);
      // remove feedback before showing it in case there
      // are multiple feedback options
      if (!message.condition && store.isShown[message.feedbackId]){
        // change input isShown store variable to false
        store.toggle(message.feedbackId);
    
        // remove feedback messages
        $input.removeAttr("style");
        $label.removeAttr("style");
        if (message.icon) {
          $("#" + message.inputId + "-icon").remove();
          $formGroup.removeClass("has-feedback");
        }
        if (message.text) {
          $("#" + message.inputId + "-text").remove();
          $("#"+ message.inputId +"-spacing").remove();  
        }
      }
      // if feedback should transition to shown
      if (message.condition && !store.isShown[message.feedbackId]) {
        // change input isShown store variable to false
        store.toggle(message.feedbackId);
        
        // display feedback
        $label.css("color", message.color);
        $input.css("border", "1px solid " + message.color);
        if (message.text) {
          $("<div id='" + message.inputId + "-text' class='col-xs-12'><p style='color: " + message.color +"; margin-bottom: 0px;'>"+ message.text +"</p></div><br id='" + message.inputId + "-spacing'/>").insertAfter($input);
        }
      
        if (message.icon) {
          $formGroup.addClass("has-feedback");
          $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>")
           .insertBefore($input);
        }  
      }
    }
  );
})();
