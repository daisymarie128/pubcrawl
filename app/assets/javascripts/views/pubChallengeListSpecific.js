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
    // app.pubChallenges.fetch({data: {pub_id: this.model.get(id)}}).done(function(){
    //   console.log('fetching challenges')
    //   $.ajax({
    //     url: '/pubChallenges',
    //     type: 'GET',
    //     data: {
    //       name: '',
    //       image: '',
    //       description: '',
    //       badge: '',
    //       pointvalue: ''
    //     }
    //   })
    var pubChallengesListSpecific = Handlebars.compile(app.templates.pubChallengesListSpecific);
    this.$el.html( pubChallengesListSpecific({pubChallenges: app.pubChallenges.toJSON()}) );
    this.$el.attr('id', 'pub-challenges-view');
    $('#content').append( this.el );
    // })
  }
});
