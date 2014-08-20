var app = app || {};

app.PubChallenges = Backbone.Collection.extend({
  model: app.PubChallenge,
  url: '/pub_challenges'

});