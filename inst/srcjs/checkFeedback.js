(function() {
  
  inputs = {};
  
  // used to allow output to appear if it has been disabled
  // by setting the cancelOuput argument to TRUE
  $(document).on('shiny:inputchanged', function(event) {
    if (inputs[event.name] === undefined) {
      $(document).off('shiny:value')
    }
  });
  
  // store all the feedbacks for a single inputId
  function Feedbacks() {
    // cache whether each feedback is shown
    this.isShown = {};
  }
  // add method to Feedbacks prototype
  (function() {
    this.add = function(feedbackId) {
      if (this.isShown[feedbackId] === undefined) {
         this.isShown[feedbackId] = false;
      }
    };
  
    this.toggle = function(feedbackId) {
      this.isShown[feedbackId] = !this.isShown[feedbackId];
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
    
    function removeFeedback() {
    
      $eLabel.css("color", "#333");
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
    if (message.condition && !inp.isShown[message.feedbackId]) {

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
  
  // selectize = FALSE
  function feedbackSelect(message) {
    var $input = findInput(message.inputId);
    var $label = $input.parent().siblings("label");
    var $formGroup = $input.parent();
    
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
      
      // stop the input from rendering any output if cancelOutput is TRUE  
      //$(document).on('shiny::inputchanged', function(event) {
      if (!message.cancelOutput || !message.condition) {
        $(document).off('shiny:value');
      } else {
        $(document).on('shiny:value', function(event) {
          event.preventDefault();
          //event.stopPropagation();
        });
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
