(function() {
  
  inputs = {};
  
  // store all the feedbacks for a single inputId
  function Feedbacks() {
    // cache whether each feedback is shown
    this.isShown = {},
              
    this.add = function(feedbackId) {
      if (this.isShown[feedbackId] === undefined) {
         this.isShown[feedbackId] = false;
      }
    },
  
    this.toggle = function(feedbackId) {
      this.isShown[feedbackId] = !this.isShown[feedbackId];
    },
    
    this.setAllFalse = function() {
      for (var fb in this.isShown) {
        this.isShown[fb] = false;
      }
    }
  }
  
  
               
  Shiny.addCustomMessageHandler(
    "checkFeedback",
    function(message) {
      
      var $input = $("#" + message.inputId);
      var $label = $input.siblings("label");
      var $formGroup = $input.parent();
      
      // remove feedback display
      function removeFeedback() {
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
      
      // create a property key = inputId and value = feedbacks associated with
      // that feedback id
      if (inputs[message.inputId] === undefined) {
        inputs[message.inputId] = new Feedbacks();
      }
      var inp = inputs[message.inputId];
      // add feedbackId to the store
      inp.add(message.feedbackId);
      // remove feedback before showing it in case there
      // are multiple feedback options
      if (!message.condition && inp.isShown[message.feedbackId]){
        // change input isShown store variable to false
        inp.toggle(message.feedbackId);
        removeFeedback();
      }
      // if feedback should transition to shown
      if (message.condition && !inp.isShown[message.feedbackId]) {
        // set all feedbacks besides feedback transitioning to isShown false
        inp.setAllFalse();
        removeFeedback();
        // change feedback isShown value to true
        inp.toggle(message.feedbackId);
        
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
