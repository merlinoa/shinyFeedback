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
  
  // return the element containing the shiny inputId
  function findInput(inputId) {
    // from https://github.com/daattali/advanced-shiny/blob/master/update-input/www/app-shinyjs.js
    // Escape characterss that have special selector meaning in jQuery
    inputId = inputId.replace( /(:|\.|\[|\]|,)/g, "\\$1" );
    
    return $("#" + inputId);
  }
  
  // feedbackHandler
  // 
  // generic function that shows the feedback next to
  // the Shiny input.
  // 
  // @param message
  // @param $el the element that the feedback us being displayed around.
  // @param $label input label
  // @param $group input group
  //
  function feedbackHandler(message, $el, $label, $group) {
    var inp = inputs[message.inputId];
    
    function removeFeedback() {
    
      $label.css("color", "#333");
      $el.removeAttr("style");
      if (message.icon) {
        $("#" + message.inputId + "-icon").remove();
        $group.removeClass("has-feedback");
      }
      if (message.text) {
        $("#" + message.inputId + "-text").remove();
        $("#"+ message.inputId +"-spacing").remove();  
      }
    }
    
    if (!message.condition && inp.isShown[message.feedbackId]){
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
      $el.css("border", "1px solid " + message.color);
      if (message.text) {
        $("<div id='" + message.inputId + "-text' class='col-xs-12'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p></div><br id='" + message.inputId + "-spacing'/>").insertAfter($el);
      }
      
      if (message.icon) {
        $group.addClass("has-feedback");
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter($el);
      }
    }
  }
  
  function feedbackDefault(message) {
    var $input = findInput(message.inputId);
    var $label = $input.siblings("label");
    var $formGroup = $input.parent();
    
    feedbackHandler(message, $input, $label, $formGroup);
  }
  
  function feedbackSelectize(message) {
    var $input = findInput(message.inputId);
    var $label = $input.parent().siblings("label");
    var $formGroup = $input.parent().eq(1);
    
    // the SELECT html tag does not actually contain the input that is displayed
    // find the the displayed input box here
    var $inputDisplayed = $input
                            .siblings(".selectize-control")
                            .children(".selectize-input");
    
    feedbackHandler(message, $inputDisplayed, $label, $formGroup);
  }
  
  // selectize = FALSE
  function feedbackSelect(message) {
    var $input = findInput(message.inputId);
    var $label = $input.parent().siblings("label");
    var $formGroup = $input.parent().eq(1);
    
    feedbackHandler(message, $input, $label, $formGroup);
  }
               
  Shiny.addCustomMessageHandler(
    "checkFeedback",
    function(message) {
      
      var $input = findInput(message.inputId);
      var tag = $input.prop("tagName");
      
      // create a property key = inputId and value = feedbacks associated with
      // that feedback id
      if (inputs[message.inputId] === undefined) {
        inputs[message.inputId] = new Feedbacks();
      }
      var inp = inputs[message.inputId];
      // add feedbackId to the store
      inp.add(message.feedbackId);
    
      // Shiny inputs where the inputId is in an <input> html element 
      if (tag === "INPUT") {
        if ($input.hasClass("js-range-slider")) {
        // function to deal with sliderInput
        } else if ($input.attr("type") === "button") {
        // function to deal with actionButtons
        } else {
        // numericInput, textInput, or passwordInput
          feedbackDefault(message);
        }
      } else if (tag === "SELECT") {
        if ($input.hasClass("selectized")) {
          // selectized = TRUE function; the default
          feedbackSelectize(message);
        } else {
          // selectized = FALSE Function
          feedbackSelect(message);
        }
      }
    }
  );
})();
