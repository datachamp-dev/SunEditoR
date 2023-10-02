
var sun_editor_binding = new Shiny.InputBinding();

$.extend(sun_editor_binding, {
    find: function(scope) {
        return $(scope).find(".sun-editor-editable textarea");
    },
    initialize: function(el) {
        var editorInstance = SUNEDITOR.create(el);
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
    }
})

Shiny.inputBindings.register(sun_editor_binding, "sun-editor-input-binding");
