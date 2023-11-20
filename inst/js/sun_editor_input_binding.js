
var sun_editor_binding = new Shiny.InputBinding();

$.extend(sun_editor_binding, {
    find: function(scope) {
        return $(scope).find(".sun-editor-textarea textarea");
    },
    initialize: function(el) {
        var placeholder = $(el).attr("placeholder") || "";
        var options = JSON.parse($(el.parentNode.parentNode).attr("data-options") || "{}");
        options.placeholder = placeholder;
        var editorInstance = SUNEDITOR.create(el, options);
        editorInstance.onChange = function(contents) {
            $(el).trigger("sunEditorChanged");
        }
        $(el).data("sunEditorInstance", editorInstance);
    },
    getValue: function(el) {
        var editorInstance = $(el).data("sunEditorInstance");
        return editorInstance.getContents();
    },
    subscribe: function(el, callback) {
        var editorInstance = $(el).data("sunEditorInstance");
        $(el).on("sunEditorChanged", function(e) {
            callback();
        });
    },
    receiveMessage: function(el, data) {
        var editorInstance = $(el).data("sunEditorInstance");
        // Update value
        if (data.hasOwnProperty("value")) {
            editorInstance.setContents(data.value);
        }
        // Update the label
        if (data.hasOwnProperty("label")) {
            var $label = $container.find('label');
            if ($label.length > 0) {
                $label.text(data.label);
            } else {
                $container.prepend($('<label>', { for: el.id, text: data.label }));
            }
        }
        // Update the placeholder
        if (data.hasOwnProperty("placeholder")) {
            editorInstance.placeholder = data.placeholder;
        }
        // Disable editor
        if (data.hasOwnProperty("disable")) {
            if (data.disable == true) {
                editorInstance.disable();
            }
        }
        // Enable editor
        if (data.hasOwnProperty("enable")) {
            if (data.enable == true) {
                editorInstance.enable();
            }
        }
    }
})

Shiny.inputBindings.register(sun_editor_binding, "sun-editor-input-binding");
