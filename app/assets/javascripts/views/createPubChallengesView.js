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

  //re fix this with form data. add the image cache to the model aswell
  createPubChallenge: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    //have to do it this way for carrier wave
    // var formData = new FormData();
    //   formData.append('pub[name]', $('#name').val());
    //   formData.append('pub[image]', $('.image')[0].files[0]);
    //   formData.append('pub[description]', $('#description').val());
    //   formData.append('pub[badge]', $('#badge').val());
    //   // formData.append('pub[badge]', $('.badge')[0].files[0]);
    //   formData.append('pub[point-value]', $('#point-value').val());
    //     console.log('were here!')
    //     console.log($('#password').val(), $('#confirm_password').val())
    //   $.ajax({
    //     url: '/pub_challenges',
    //     data: formData,
    //     cache: false,
    //     contentType: false,
    //     processData: false,
    //     type: 'POST'
    //   }).done( function (){
    //   }).fail( function (){
    //     console.log('failed')
    //   });
//////ytes

    var newPubChallenge = new app.PubChallenge({
      name: $('#name').val(),
      image: $('#image').val(),
      description: $('#description').val(),
      badge: $('#badge').val(),
      pointValue: $('#point-value').val(),
      tasks: JSON.stringify($('.taskname').map(function () { return $(this).val(); }).get())
    });
    newPubChallenge.save();
    // Send view to a users list
    // app.pubChallenges.fetch(function(){
    //   console.log('help meeeeee')
      app.router.navigate("pub_challenges/list", true);
    // })

  },

  addTask: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    var addTask = Handlebars.compile(app.templates.addTask);
      $('#pub-challenge-view').append( addTask );
  }


});