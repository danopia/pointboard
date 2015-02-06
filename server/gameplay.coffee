Meteor.methods
  playCard: (table, card) ->
    throw 'wtf' unless @userId
    check table, String
    check card, Number
    throw 'no table' unless Tables.findOne(_id: table, 'users.id': @userId)

    Tables.update {_id: table, 'users.id': @userId}, $set:
      'users.$.card': card

  wipeTable: (tableId) ->
    throw 'wtf' unless @userId
    check tableId, String
    table = Tables.findOne(_id: tableId, 'users.id': @userId)
    throw 'no table' unless table

    Tables.update tableId, $set:
      users: table.users.map((obj) -> id: obj.id)
