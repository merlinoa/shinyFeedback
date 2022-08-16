(function() {
  var baseInputFeedback = {
    "find": function(inputId) {
      var input = findInput(inputId);
      var label = input.siblings("label");
      var formGroup = input.parent();
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      };
    },
    "hasFeedback": function(inputObject) {
      return inputObject.formGroup.hasClass("has-feedback");
    },
    /* show the feedback along side the input
     *
     * @param message the `message` object sent from Shiny
     */
    "show": function(inputObject, message) {
      this.setFeedback(inputObject, message, true);
      this.setColor(inputObject, message);
      this.setText(inputObject, message);
      this.setIcon(inputObject, message);
    },
    /* Hide the feedback
     *
     * @param message the `message` object sent from Shiny
     */
    "hide": function(inputObject, message) {
      var msg = {inputId: escapeId(message.inputId)};
      this.setFeedback(inputObject, msg, false);
      this.setColor(inputObject, msg);
      this.setText(inputObject, msg);
      this.setIcon(inputObject, msg);
    },
    /* The setXXX methods below can be individually overridden by inheritors.
     *
     * @param inputObject The object returned from this.find()
     * @param message The message received from Shiny. If message.color,
     *   message.text, etc. are present, show that feedback; otherwise, hide
     *   or undo it.
     */
    "setFeedback": function(inputObject, message, show) {
      if (show) {
        inputObject.formGroup.addClass("has-feedback");
      } else {
        inputObject.formGroup.removeClass("has-feedback");
      }
    },
    "setColor": function(inputObject, message) {
      if (message.color) {
        inputObject.label.css("color", message.color);
        inputObject.input.css("border", "1px solid " + message.color);
      } else {
        inputObject.label.css("color", "");
        inputObject.input.css("border", "");
      }
    },
    "setText": function(inputObject, message) {
      if (message.text) {
        $("<div id='" + message.inputId + "-text'><p style='color: " + message.color + "; position: " + message.textPosition + "; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(inputObject.input);
      } else {
        $("#" + message.inputId + "-text").remove();
      }
    },
    "setIcon": function(inputObject, message) {
      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter(inputObject.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }
  };
  
  // textInputFeedback functions
  var textInputFeedback = $.extend({}, baseInputFeedback, {
  });
  
  // textAreaInputFeedback functions
  var textAreaInputFeedback = $.extend({}, baseInputFeedback, {
    /* Custom width logic */
    "setIcon": function(inputObject, message) {
      
      var obj = inputObject;
      if (message.icon) {
          
        // Initial fix of formGroup width
        obj.formGroup.css('width', obj.input[0].offsetWidth);
        
        // Fix width of parent element for icon to show correctly
        $("#" + message.inputId).bind('mouseup', function(inputObject) {
          
          // ONLY update width when Feedback icon is visible (otherwise uses different parent element)
          if ($('#' + inputObject.target.id + '-icon').is(':visible')) {
            var obj = $(inputObject.target);
            var parent = $(inputObject.target.offsetParent);
            
            obj.css('margin', '0px');
            parent.css('width', inputObject.target.offsetWidth);
          }
          
        });
        
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter(obj.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }    
  });
  
  // numericInputFeedback functions
  var numericInputFeedback = $.extend({}, baseInputFeedback, {
    /* Custom margin */
   "setIcon": function(inputObject, message) {
      
      var obj = inputObject;
            
      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + 
        message.color + ";'>" + message.icon + "</span>").insertAfter(obj.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }    
  });
  
  
  // selectInputFeedback functions
  var selectInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      var input = findInput(inputId);
      
      var label = input.parent().siblings("label");
      var formGroup = input.parent();
      
      // get the correct input element if selectize === true
      var is_selectize = input.hasClass("selectized") === true;
      if (is_selectize === true) {
        
        input = input.siblings(".selectize-control")
          .find(".selectize-input");  
        
      }
      
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup,
        "selectize": is_selectize
      };
    },
        
    /* Custom padding/margin */
    "setIcon": function(inputObject, message) {
      
      var obj = inputObject;
      
      if (message.icon) {
        var margin_right = "10px";
        if (inputObject.selectize === true) {
          margin_right = "20px";
        }
        
        obj.input.parent().css("padding-right", 0);
        $("<span id='" + message.inputId + 
        "-icon' class='form-control-feedback' style='color: " + message.color + 
        "; margin-right: " + margin_right + ";'>" + message.icon + 
        "</span>").insertBefore(obj.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }    
  });

  // dateInputFeedback functions
  var dateInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      var formGroup = findInput(inputId);
      var label = formGroup.children("label");
      var input = formGroup.children("input");
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      };
    }
  });
  
  
  // dateRangeInputFeedback functions
  var dateRangeInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      var formGroup = findInput(inputId);
      var label = formGroup.children("label");
      var input = formGroup.children("div");
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      };
    }    
  });
  
  
  // airPickerInputFeedback functions
  var airPickerInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      var input = findInput(inputId);
      var formGroup = input.closest(".form-group");
      var inputDiv = formGroup.children("div");
      var label = formGroup.children("label");
    
      return {
        "input": input,
        "inputDiv": inputDiv,
        "label": label,
        "formGroup": formGroup
      };
    },
    
    "setColor": function(inputObject, message) {
      
      var obj = inputObject ;
      if (message.color) {
        obj.label.css("color", message.color);
        obj.inputDiv.css("border", "1px solid " + message.color);  
      } else {
        obj.label.css("color", "");
        obj.inputDiv.css("border", "");
      }
    },
    /* Puts the message after inputDiv, not input */
    "setText": function(inputObject, message) {
      if (message.text) {
        $("<div id='" + message.inputId + "-text'><p style='color: " + message.color + "; position: " + message.textPosition + "; margin-top: 0px;'>"+ message.text +"</p>").insertAfter(inputObject.inputDiv);
      } else {
        $("#" + message.inputId + "-text").remove();
      }
    },
    /* Custom right margin */
    "setIcon": function(inputObject, message) {
      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + "; margin-right: 40px;'>" + message.icon + "</span>").insertAfter(inputObject.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }
  });
  
  
  // pickerInputFeedback functions
  var pickerInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      var input = findInput(inputId).parent();
      var label = input.siblings("label");
      var formGroup = input.parent();
      
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup
      };
    },
    
    /* Icon has custom right margin */
    "setIcon": function(inputObject, message) {
      if (message.icon) {
        
        //obj.input.parent().css("padding-right", 0);
        
        $("<span id='" + message.inputId + 
        "-icon' class='form-control-feedback' style='color: " + message.color + 
        "; margin-right: 15px;'>" + message.icon + 
        "</span>").insertBefore(inputObject.input);
      } else {
        $("#" + message.inputId + "-icon").remove();
      }
    }
  });
  
  
  // fileInputFeedback functions
  var fileInputFeedback = $.extend({}, baseInputFeedback, {
    "find": function(inputId) {
      
      var formGroup = findInput(inputId);
      var label = formGroup.parent().parent().parent().siblings('label');
      var input = formGroup.parent().parent().parent('div');
      var progress = input.siblings('div.progress').children('div.progress-bar');
    
      return {
        "input": input,
        "label": label,
        "formGroup": formGroup,
        "progress": progress
      };
    },

    // fileInputFeedback's structure is different enough from baseInputFeedback
    // that we override the show/hide methods instead of overriding individual
    // setXXX() methods.
    
    "show": function(inputObject, message) {
      
      var obj = inputObject;
      
      obj.formGroup.addClass("has-feedback");
      
      if (message.color) {
        obj.label.css("color", message.color);
        obj.input.css("border", "1px solid " + message.color);
        obj.progress.css("background-color", message.color);
      }

      if (message.text) {
        obj.progress.html(message.text);
      }

      if (message.icon) {
        $("<span id='" + message.inputId + "-icon' class='form-control-feedback' style='color: " + message.color + ";'>" + message.icon + "</span>").insertAfter(obj.input.children('input'));
      }
    },
    
    "hide": function(inputObject, message) {
      
      var obj = inputObject;
      
      inputObject.formGroup.removeClass("has-feedback");
      obj.label.css("color", "");
      obj.input.css("border", "");
      obj.progress.css("background-color", "#337ab7");
      obj.progress.html("Upload complete");
      $("#" + message.inputId + "-icon").remove();
    }
  });
  
  
  // all shiny input bindings that are supported by shinyFeedback
  var supportedInputs = [
    {name: "shiny.selectInput", feedback: selectInputFeedback},
    {name: "shiny.dateInput", feedback: dateInputFeedback},
    {name: "shiny.dateRangeInput", feedback: dateRangeInputFeedback},
    {name: "shinyWidgets.AirPickerInput", feedback: airPickerInputFeedback},
    {name: "shiny.sliderInput", feedback: textInputFeedback},
    {name: "shiny.numberInput", feedback: numericInputFeedback},
    {name: "shiny.passwordInput", feedback: textInputFeedback},
    {name: "shiny.textareaInput", feedback: textAreaInputFeedback},
    {name: "shiny.textInput", feedback: textInputFeedback},
    {name: "shiny.pickerInput", feedback: pickerInputFeedback},
    {name: "shinyWidgets.pickerInput", feedback: pickerInputFeedback},
    {name: "shinyWidgets.autonumericInput", feedback: numericInputFeedback},
    {name: "shiny.fileInputBinding", feedback: fileInputFeedback}
  ];
  
  // from https://github.com/daattali/advanced-shiny/blob/master/update-input/www/app-shinyjs.js
  // Escape characters that have special selector meaning in jQuery
  function escapeId(id) {
    id = id.replace( /(:|\.|\[|\]|,)/g, "\\$1" );
    return(id)
  }
  
  // return the element containing the shiny inputId
  function findInput(inputId) {
    // Escape characters that have special selector meaning in jQuery
    inputId = escapeId(inputId);
    return $("#" + inputId);
  }
  
  function findInputBinding(id) {
    // Escape characters that have special selector meaning in jQuery
    id = escapeId(id);
    
    var $el = $("#" + id);
    return $el.data("shinyInputBinding");
  }
  
  function findInputFeedback(inputName) {
    var inputFeedback = null;
    
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
        console.error('input binding is not supported by shinyFeedback');
        return;
      } 
      
      var theInput = feedbackFun.find(message.inputId);
      
      if (feedbackFun.hasFeedback(theInput) === false) {
        feedbackFun.show(theInput, message);
      } else {
        feedbackFun.hide(theInput, message);
        feedbackFun.show(theInput, message);
      }
      
    }
  );
  
  Shiny.addCustomMessageHandler(
    "hideFeedback",
    function(message) {
      var inputName = findInputBinding(message.inputId).name;
      // get the correct feeback handler functions 
      var feedbackFun = findInputFeedback(inputName);
      if (feedbackFun === null) {
        // the input type does not have feedback handlers
        console.error("input binding is not supported by shinyFeedback")
        return
      } 
      
      var theInput = feedbackFun.find(message.inputId)
      feedbackFun.hide(theInput, message)
      
    }
  );
  
  
  Shiny.addCustomMessageHandler(
    "feedback",
    function(message) {
      var inputName = findInputBinding(message.inputId).name;
    
      // get the correct feeback handler functions 
      var feedbackFun = findInputFeedback(inputName);
      if (feedbackFun === null) {
        // the input type does not have feedback handlers
        console.error("input binding is not supported by shinyFeedback")
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
  );
})()
  