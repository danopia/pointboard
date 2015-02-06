Meteor.methods playCard: (table, card) ->
  throw 'wtf' unless @userId
  check table, String
  check card, Number

  Tables.update {_id: table, 'users.id': @userId}, $set:
    'users.$.card': card
