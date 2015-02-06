Template.root.helpers
  table: -> Tables.findOne
    _id: Session.get('tableId')
    pin: $exists: true

Template.nav.events
  'submit [role=rename]': ->
    Meteor.users.update Meteor.userId(), $set:
      'profile.name': $('#name').val()
    $('#name').val('')
    false

Tracker.autorun ->
  Session.set 'name', Meteor.user().profile.name if Meteor.user()
