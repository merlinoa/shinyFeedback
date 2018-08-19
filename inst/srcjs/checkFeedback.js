(function() {
  
  inputs = {};
  
  // store all the feedbacks for a single inputId
  function Feedbacks() {
    // cache whether each feedback is shown
    this.isShown = {};
    
    // store label color so we can revert to original label color when feedback
    // is removed
    this.originalLabelColor = null; 
  }
  // add method to Feedbacks prototype
  (function() {
    this.add = function(feedbackId) {
      this.isShown[feedbackId] = false;
    };
  
    this.toggle = function(feedbackId) {
      this.isShown[feedbackId] = !this.isShown[feedbackId];
    };
    
    this.setLabelColor = function(rgb) {
      this.originalLabelColor = rgb;
    };
    
    this.setAllFalse = function() {
      for (var fb in this.isShown) {
        this.isShown[fb] = false;
      }
    };
  }).call(Feedbacks.prototype);
  
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
  // @param $eInput the input element
  // @param $eLabel the label element
  // @param $egroup the form-group element
  //
  function feedbackHandler(message, $eInput, $eLabel, $eGroup) {
    var inp = inputs[message.inputId];
    
    // if `inp.originalLabelColor` is not set, set it.
    // `inp.originalLabelColor` is used to restore the label of the input back to
    // its original color after the feeback is removed
    if (!inp.originalLabelColor) {
      var labelColor = $eLabel.css("color");
      inp.setLabelColor(labelColor);
    }
    
    function removeFeedback() {
      
      $eLabel.css("color", inp.originalLabelColor);
      $eInput.removeAttr("style");
      if (message.icon) {
        $("#" + message.inputId + "-icon").remove();
        $eGroup.removeClass("has-feedback");
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
    if (message.condition) {
      
      // set all feedbacks besides feedback transitioning to isShown false
      inp.setAllFalse();
      removeFeedback();
      // change feedback isShown value to true
      inp.toggle(message.feedbackId);
      
      // display feedback
      if (message.color) {
        $eLabel.css("color", message.color);
        $eInput.css("border", "1px solid " + message.color);  
      }
      
      if (message.text) {
        $("<div id='" + message.inputId + "-text' class='col-xs-12'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter($eInput);
        $eGroup.append("</div><br id='" + message.inputId + "-spacing'/>");
      }
      
      if (message.icon) {
        $eGroup.addClass("has-feedback");
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter($eInput);
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
    var $formGroup = $input.parent();
    
    // the SELECT html tag does not actually contain the input that is displayed
    // find the the displayed input box here
    var $inputDisplayed = $input
                            .siblings(".selectize-control")
                            .find(".selectize-input");
    
    feedbackHandler(message, $inputDisplayed, $label, $formGroup);
  }
  
  function feedbackSelect(message) {
    var $input = findInput(message.inputId);
    
    // could not find a better way to distinguish between if selectize = TRUE by only 
    // looking at the input binding, so I am having to check the input class
    if ($input.hasClass("selectized")) {
      // selectized = TRUE function; the default
      feedbackSelectize(message);
    } else {
      // selectized = FALSE Function
      var $label = $input.parent().siblings("label");
      var $formGroup = $input.parent();
    
      feedbackHandler(message, $input, $label, $formGroup);
    }
  }
  
  // dateInput
  function feedbackDate(message) {
    var $formGroup = findInput(message.inputId);
    var $label = $formGroup.children("label");
    var $input = $formGroup.children("input");
    
    feedbackHandler(message, $input, $label, $formGroup);
  }
  
  // all shiny input bindings that are supported by shinyFeedback
  var bindingNames = [
    "shiny.selectInput",
    "shiny.dateInput",
    "shiny.sliderInput",
    "shiny.numberInput",
    "shiny.passwordInput",
    "shiny.textareaInput",
    "shiny.textInput"
  ];
  
  function findInputBinding(id) {
    var $el = $("#" + id);
    if ($el.length === 0 || !$el.data("shinyInputBinding")) {
      var msg = "shinyFeedback: Unable to find input binding for element with id " + id;
      throw msg;
    }
    
    return $el.data("shinyInputBinding");
  }
  
  function checkInputSupported(inputBindingName) {
    if ($.inArray(inputBindingName, bindingNames) === -1) {
      var msg = "shinyFeedback: Input Binding " + inputBindingName + " is not supported by shinyFeedback";
      throw msg;
    }
    return;
  }
               
  Shiny.addCustomMessageHandler(
    "checkFeedback",
    function(message) {
      
      var myBindingName = findInputBinding(message.inputId).name;
      //check that the input type is supported
      checkInputSupported(myBindingName);
      
      var inp = null;
      if (inputs[message.inputId] === undefined) {
        // create an object holding all the feedbacks for the given inputId.
        // this object will hold the isShown state of each feedback (true or false). 
        // There can be multiple feedbacks associated with a single input.
        inp = inputs[message.inputId] = new Feedbacks();
        // add feedbackId to the store of feedbacks for the input
        // and set the isShown property to false
        inp.add(message.feedbackId);
      } else {
        inp = inputs[message.inputId];  
      }
      
    
      // call right function to insert / remove feedback message
      // depending on the type of input binding
      switch (myBindingName) {
        case "shiny.dateInput":
          feedbackDate(message);
          break;
        case "shiny.selectInput":
          feedbackSelect(message);
          break;
        default:
          feedbackDefault(message);
      }
    }
  );
})();
