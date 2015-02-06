Template.lobby.helpers
  tables: -> Tables.find()

Template.lobby.events
  'click li': ->
    if @pin
      Session.set 'tableId', @_id
    else
      Meteor.call 'joinTable', @_id, prompt('Table PIN?'), (err, resp) =>
        if err or not resp
          alert err
        else
          Session.set 'tableId', @_id

  'submit form': ->
    Tables.insert
      name: $('#name').val()
      pin: $('#pin').val()
      users: [id: Meteor.userId()]
      exposed: false
    , (err, resp) ->
      if err
        alert err
      else
        Session.set 'tableId', resp

    false
