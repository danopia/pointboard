Meteor.methods
  joinTable: (table, pin) ->
    throw 'wtf' unless @userId
    check table, String
    check pin, String

    Tables.update({_id: table, pin: pin}, $push: users: id: @userId) > 0

  leaveTable: (table) ->
    throw 'wtf' unless @userId
    check table, String

    Tables.update({_id: table, 'users.id': @userId}, $pull: users: id: @userId) > 0
