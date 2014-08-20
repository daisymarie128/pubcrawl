var app = app || {};

app.PubChallengesCreateView = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click #create-challenge': 'createPubChallenge',
    'click #add-task': 'addTask'
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
      name: $('#name').val(),
      image: $('#image').val(),
      description: $('#description').val(),
      badge: $('#badge').val(),
      pointValue: $('#point-value').val(),
      taskName: $('#taskname').val()
    });
    newPubChallenge.save();
    // Send view to a users list
    app.router.navigate("pub_challenges/list", true);
  },

  addTask: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    var addTask = Handlebars.compile(app.templates.addTask);
      $('#pub-challenge-view').append( addTask );
  }


});