var app = app || {};

app.CreatePub = Backbone.View.extend({
  tagName: 'div',

  events: {
    'click button': 'createPub'
  },

  initialize: function () {
    if (app.currentView) {
      app.currentView.remove();
    }
    app.currentView = this;
  },

  render: function () {
    var createPub = Handlebars.compile(app.templates.createPub);
    this.$el.html( createPub(app.currentUser || {} ) );
    this.$el.attr('id', 'create-pub');
    $('#content').html(this.el);
  },

  createPub: function () {
    // stops the form from submitting params with the button.
    event.preventDefault();
    // saves to the rails database
    // console.log($('#password').val())
    var formData = new FormData();
    formData.append('pub[image]', $('#image').val());
      formData.append('pub[name]', $('#name').val());
      formData.append('pub[username]', $('#username').val());
      formData.append('pub[address]', $('#address').val());
      formData.append('pub[email]', $('#email').val());
      formData.append('pub[image]', $('.image')[0].files[0]);
      formData.append('pub[description]', $('#description').val());
      formData.append('pub[password]', $('#password').val());
      formData.append('pub[password_confirmation]', $('#confirm_password').val());
      // formData.append('pub[is_pub]', true);
        console.log('were here!')
        console.log($('#password').val(), $('#confirm_password').val())
      $.ajax({
        url: '/pubs',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        sucess: function (){
        console.log('did this hsit work')
        app.router.navigate("pubs/list", true);
        },
        fail: function (){
        console.log('i assumed this would fail')
      }
      });




    // newPub.save();
    // adds to the backbone memory (browser)
    // app.users.add(newUser);
    // Send view to a users list
  }

});
