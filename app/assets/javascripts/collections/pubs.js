var app = app || {};

app.Pubs = Backbone.Collection.extend({
  model: app.Pub,
  url: '/pubs'

});