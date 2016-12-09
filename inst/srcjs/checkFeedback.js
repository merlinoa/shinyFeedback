(function() {

  var store = {
    // cache the validation state for each input with feedback
    isShown: {},
              
    add: function(inputId) {
      if (store.isShown[inputId] === undefined) {
         store.isShown[inputId] = true;
      }
    },
  
    toggle: function(inputId) {
      store.isShown[inputId] = !store.isShown[inputId];
    }
  };
               
  this.shinyjs.checkFeedback = function(params) {
    var defaultParams = {
      inputId: null, 
      condition: null,
      text: null,
      color: null, 
      icon: null
    };

    params = shinyjs.getParams(params, defaultParams);
    
    var $input = $("#" + params.inputId);
    var $label = $input.siblings("label");
    var $formGroup = $input.parent();
    
    // add input to the store
    store.add(params.inputId);
  
    // if input transitions to invalid state
    if (params.condition && store.isShown[params.inputId]) {
      // change input isShown store variable to false
      store.toggle(params.inputId);
      // display feedback
      $label.css("color", params.color);
      $input.css("border", "1px solid " + params.color);
      if (params.text) {
        $("<div id='" + params.inputId + "-text' class='col-xs-12'><p style='color: " + params.color +"; margin-bottom: 0px;'>"+ params.text +"</p></div><br id='spacing'/>").insertAfter($input);
      }
      
      if (params.icon) {
        $formGroup.addClass("has-feedback");
        $("<span id='" + params.inputId + "-icon' class='form-control-feedback' style='color: " + params.color + ";'>" + params.icon + "</span>")
        .insertAfter($input);
      }  
      
      // if input transitions from shown to hidden
    } else if (!params.condition && !store.isShown[params.inputId]){
      // change input isShown store variable to false
      store.toggle(params.inputId);
      // remove feedback messages
      $input.removeAttr("style");
      $label.removeAttr("style");
      if (params.icon) {
        $("#" + params.inputId + "-icon").remove();
        $formGroup.removeClass("has-feedback");
      }
      if (params.text) {
        $("#" + params.inputId + "-text").remove();
        $("#spacing").remove();  
      }
    }
  };
})();
