var app = app || {};

app.PubChallengesCreateView = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click button': 'createPubChallenge'
  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var createPubChallengeView = Handlebars.compile(app.templates.createPubChallengeView);
    this.$el.html( createPubChallengeView );
    this.$el.attr('id', 'pub-challenge-view');
    $('#content').html(this.el);
  },

  createPubChallenge: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    var newPubChallenge = new app.PubChallenge({
      name: $('#first_name').val(),
      image: $('#last_name').val(),
      description: $('#username').val(),
      badge: $('#email').val()});
    newPubChallenge.save();
    // Send view to a users list
    app.router.navigate("pub_challenge/list", true);
  }

});