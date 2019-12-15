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
        $("<div id='" + message.inputId + "-text'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
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
    }
    
  }
  
  
  // numericInputFeedback functions
  var numericInputFeedback = {
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
        $("<div id='" + message.inputId + "-text'><p style='color: " + 
        message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
      }
      
      obj.formGroup.addClass("has-feedback");
      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + 
        message.color + "; margin-right: 20px;'>" + message.icon + "</span>").insertAfter(obj.input);
      }
    },
    
    "hide": function(inputObject, message) {
      
      var obj = inputObject
      
      obj.label.css("color", '');
      obj.input.removeAttr("style");
      
      $("#" + message.inputId + "-icon").remove();
      
      inputObject.formGroup.removeClass("has-feedback");
      
      $("#" + message.inputId + "-text").remove();
    }
    
  }
  
  
  var selectInputFeedback = {
    "find": function(inputId) {
      var input = findInput(inputId)
      
      var label = input.parent().siblings("label");
      var formGroup = input.parent();
      
      // get the correct input element if selectize === true
      var is_selectize = input.hasClass("selectized") === true
      if (is_selectize === true) {
        
        input = input.siblings(".selectize-control")
          .find(".selectize-input");  
        
      }
      
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup,
        "selectize": is_selectize
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
        $("<div id='" + message.inputId + "-text'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
      }
      
      obj.formGroup.addClass("has-feedback");
      if (message.icon) {
        var margin_right = "10px"
        if (inputObject.selectize === true) {
          margin_right = "20px"
        }
        
        obj.input.parent().css("padding-right", 0);
        $("<span id='" + message.inputId + 
        "-icon' class='form-control-feedback' style='color: " + message.color + 
        "; margin-right: " + margin_right + ";'>" + message.icon + 
        "</span>").insertBefore(obj.input);
      }
    },
    
    "hide": function(inputObject, message) {
      
      var obj = inputObject
      
      obj.label.css("color", '');
      obj.input.removeAttr("style");
      
      $("#" + message.inputId + "-icon").remove();
      
      inputObject.formGroup.removeClass("has-feedback");
      
      $("#" + message.inputId + "-text").remove();
    }
    
  }
  
  
  
  
  // textInputFeedback functions
  var dateInputFeedback = {
    "find": function(inputId) {
      var formGroup = findInput(inputId);
      var label = formGroup.children("label");
      var input = formGroup.children("input");
    
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
        $("<div id='" + message.inputId + "-text'><p style='color: " + message.color +"; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(obj.input);
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
    }
    
  }
  
  
  
  
  // all shiny input bindings that are supported by shinyFeedback
  var supportedInputs = [
    {name: "shiny.selectInput", feedback: selectInputFeedback},
    {name: "shiny.dateInput", feedback: dateInputFeedback},
    {name: "shiny.sliderInput", feedback: textInputFeedback},
    {name: "shiny.numberInput", feedback: numericInputFeedback},
    {name: "shiny.passwordInput", feedback: textInputFeedback},
    {name: "shiny.textareaInput", feedback: textInputFeedback},
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
  
  
  Shiny.addCustomMessageHandler(
    'feedback',
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
      
      if (message.show === true) {
        if (feedbackFun.hasFeedback(theInput) === false) {
          feedbackFun.show(theInput, message)
        } else {
          feedbackFun.hide(theInput, message)
          feedbackFun.show(theInput, message)
        }  
      } else {
        feedbackFun.hide(theInput, message)
      }
      
    }
  )
})()
  