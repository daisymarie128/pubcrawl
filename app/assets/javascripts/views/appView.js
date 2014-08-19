var app = app || {};

app.AppView = Backbone.View.extend({

  el: '#main',

  events: {
  },

  initialize: function () {

  },

  render: function () {

  },

  //
  createUser: function () {
    app.router.navigate("users/create", true);
  },

  createPub: function () {
    app.router.navigate("pubs/create", true);
  },

  createPubChallenge: function () {
    app.router.navigate("pub_challenges/create", true);
  }

});

