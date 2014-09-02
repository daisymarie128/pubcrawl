var app = app || {};

app.PubSingleModelView = Backbone.View.extend({
  tagName: 'div',
  events: {
  },

  initialize: function () {

   },

  render: function () {
    console.log(this.model)
    // console.log(this.$el)
    // console.log()
    var template = Handlebars.compile( app.templates.pubSingleModelView )
    this.$el.html( template( this.model.toJSON() ) )
    // this.$el.attr('id', 'pubs-list-view');
    // $('#content').append( this.el );
    return this.$el
  },

  viewPubChallengesListSpecific: function () {

  }
});
