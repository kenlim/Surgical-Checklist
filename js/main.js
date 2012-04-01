(function() {
  var Checklist, ChecklistDoc, DocumentView, Item, appView, log,
    __slice = Array.prototype.slice;

  log = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    if (console.log != null) return console.log.apply(console, args);
  };

  $(function() {}, ChecklistDoc = Backbone.Model.extend({
    initialize: function(stuff) {
      return this.url = stuff.url;
    }
  }), Checklist = Backbone.Model.extend(), Item = Backbone.Model.extend(), DocumentView = Backbone.View.extend({
    model: ChecklistDoc,
    el: "#documentView",
    initialize: function() {
      this.model.bind('change', this.render, this);
      return this.model.fetch({
        success: function() {
          return log("A winner is you");
        },
        error: function(model, response) {
          return log("Error fetching DocumentView", model, response);
        }
      });
    },
    template: _.template($('#document-template').html()),
    render: function() {
      log("finish!");
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    }
  }), appView = new DocumentView({
    model: new ChecklistDoc({
      url: "who-surgical-checklist.json"
    })
  }));

}).call(this);
