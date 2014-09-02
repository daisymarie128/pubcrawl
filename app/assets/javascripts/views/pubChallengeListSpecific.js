var app = app || {};

app.PubChallengesListSpecific = Backbone.View.extend({

  tagName: 'div',

  events: {

  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var list = this;
    app.pubChallenges.fetch({data: {pub_id: this.model.get('id')}}).done(function(){
      var pubChallengesListSpecific = Handlebars.compile(app.templates.pubChallengesListSpecific);
      console.log(list.$el)
      list.$el.html( pubChallengesListSpecific({pubChallenges: app.pubChallenges.toJSON()}) );
      list.$el.attr('id', 'pub-challenges-view');
      $('#content').append( list.el );
      })

    // })
  }
});
