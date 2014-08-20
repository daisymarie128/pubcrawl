var app = app || {};

app.Achievements = Backbone.Collection.extend({
  model: app.Achievement,
  url: '/achievements'

});