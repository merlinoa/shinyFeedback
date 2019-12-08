(function() {
  
  
  // textInputFeedback functions
  var textInputFeedback = {
    "find": function(inputId) {
      var input = findInput(inputId);
      var label = input.siblings("label");
      var formGroup = input.parent();
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      }
    },
    
    "hasFeedback": function(inputObject) {
      
      return inputObject.formGroup.hasClass("has-feedback")
    },
    
    /* show the feedback along side the input
    *
    * @param message the `message` object sent from Shiny
    * 
    */
    "show": function(inputObject, message) {
      
      var obj = inputObject 
      
      if (message.color) {
        obj.label.css("color", message.color);
        obj.input.css("border", "1px solid " + message.color);  
      }
      
      if (message.text) {
        $("<div id='" + message.inputId + "-text' class='col-xs-12'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
        obj.formGroup.append("</div><br id='" + message.inputId + "-spacing'/>");
      }
      
      obj.formGroup.addClass("has-feedback");
      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter(obj.input);
      }
    },
    
    "hide": function(inputObject, message) {
      
      var obj = inputObject
      
      obj.label.css("color", '');
      obj.input.removeAttr("style");
      
      $("#" + message.inputId + "-icon").remove();
      
      inputObject.formGroup.removeClass("has-feedback");
      
      $("#" + message.inputId + "-text").remove();
      $("#" + message.inputId + "-spacing").remove();
    }
    
  }
  
  var selectInputFeedback = {
    "find": function(inputId) {
      var input = findInput(inputId)
      
      var label = input.parent().siblings("label");
      var formGroup = input.parent();
      
      // get the correct input element if selectize === true
      if (input.hasClass("selectized") === true) {
        
        input = input.siblings(".selectize-control")
          .find(".selectize-input");  
        
      }
      
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      }
    },
    
    "hasFeedback": function(inputObject) {
      
      return inputObject.formGroup.hasClass("has-feedback")
    },
    
    /* show the feedback along side the input
    *
    * @param message the `message` object sent from Shiny
    * 
    */
    "show": function(inputObject, message) {
      
      var obj = inputObject 
      
      if (message.color) {
        obj.label.css("color", message.color);
        obj.input.css("border", "1px solid " + message.color);  
      }
      
      if (message.text) {
        $("<div id='" + message.inputId + "-text' class='col-xs-12'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
        obj.formGroup.append("</div><br id='" + message.inputId + "-spacing'/>");
      }
      
      obj.formGroup.addClass("has-feedback");
      if (message.icon) {
        obj.input.parent().css("padding-right", 0);
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertBefore(obj.input);
      }
    },
    
    "hide": function(inputObject, message) {
      
      var obj = inputObject
      
      obj.label.css("color", '');
      obj.input.removeAttr("style");
      
      $("#" + message.inputId + "-icon").remove();
      
      inputObject.formGroup.removeClass("has-feedback");
      
      $("#" + message.inputId + "-text").remove();
      $("#" + message.inputId + "-spacing").remove();
    }
    
  }
  
  // all shiny input bindings that are supported by shinyFeedback
  var supportedInputs = [
    {name: "shiny.selectInput", feedback: selectInputFeedback},
    //"shiny.dateInput",
    //"shiny.sliderInput",
    {name: "shiny.numberInput", feedback: textInputFeedback},
    {name: "shiny.passwordInput", feedback: textInputFeedback},
    //"shiny.textareaInput",
    {name: "shiny.textInput", feedback: textInputFeedback}
  ];
  
  // return the element containing the shiny inputId
  function findInput(inputId) {
    // from https://github.com/daattali/advanced-shiny/blob/master/update-input/www/app-shinyjs.js
    // Escape characterss that have special selector meaning in jQuery
    inputId = inputId.replace( /(:|\.|\[|\]|,)/g, "\\$1" );
    
    return $("#" + inputId);
  }
  
  function findInputBinding(id) {
    var $el = $("#" + id);
    
    return $el.data("shinyInputBinding");
  }
  
  function findInputFeedback(inputName) {
    var inputFeedback = null
    
    for(var i = 0; i < supportedInputs.length; i++) {
      if (supportedInputs[i].name === inputName) {
        inputFeedback = supportedInputs[i].feedback;
        break;
      }
    }
    
    return inputFeedback;
  }
  
  
  
  Shiny.addCustomMessageHandler(
    'showFeedback',
    function(message) {
      
      var inputName = findInputBinding(message.inputId).name;
    
      // get the correct feeback handler functions 
      var feedbackFun = findInputFeedback(inputName);
      if (feedbackFun === null) {
        // the input type does not have feedback handlers
        console.error('input binding is not supported by shinyFeedback')
        return
      } 
      
      var theInput = feedbackFun.find(message.inputId)
      
      if (feedbackFun.hasFeedback(theInput) === false) {
        feedbackFun.show(theInput, message)
      }
      
    }
  )
  
  Shiny.addCustomMessageHandler(
    'hideFeedback',
    function(message) {
      var inputName = findInputBinding(message.inputId).name;
      // get the correct feeback handler functions 
      var feedbackFun = findInputFeedback(inputName);
      if (feedbackFun === null) {
        // the input type does not have feedback handlers
        console.error('input binding is not supported by shinyFeedback')
        return
      } 
      
      var theInput = feedbackFun.find(message.inputId)
      
      feedbackFun.hide(theInput, message)
      
    }
  )
})()
  