var app = app || {};

app.PubsListView = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click .view-button': 'viewPubChallengesListSpecific'
  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
    // this.render()
  },

  render: function () {
    var list = this
    console.log('nothing ever works')
    var pubsListView = app.templates.pubsListView;
    this.$el.html( pubsListView );
    var ul = list.$el.find('#publist')
    app.pubs.each(function(pub){
      console.log(pub);
      var singlePubView = new app.PubSingleModelView( {model: pub} );
      ul.append( singlePubView.render() );
    })
    this.$el.attr('id', 'pubs-list-view');
    $('#content').append( this.el );
  },

  viewPubChallengesListSpecific: function () {
    console.log(this)
    // app.router.navigate("pub_challenges/:id", true);
  }
});
