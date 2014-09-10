var app = app || {};

app.LandingView = Backbone.View.extend({
  tagName: 'div',

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var landing = app.templates.landingView;
    this.$el.html(landing)
    this.$el.attr('id', 'landing')
    $('#container').append(this.el)
  }
})