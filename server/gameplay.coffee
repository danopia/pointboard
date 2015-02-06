Meteor.methods
  playCard: (table, card, name) ->
    throw 'wtf' unless @userId
    check table, String
    check card, Number
    throw 'no table' unless Tables.findOne(_id: table, 'users.id': @userId)

    Tables.update {_id: table, 'users.id': @userId}, $set:
      'users.$.card': card
      'users.$.name': name

    newTable = Tables.findOne table
    if newTable.users.every((user) -> user.card)
      Tables.update table, $set: exposed: true

  revokeCard: (table) ->
    throw 'wtf' unless @userId
    check table, String
    throw 'no table' unless Tables.findOne(_id: table, 'users.id': @userId)

    Tables.update {_id: table, 'users.id': @userId}, $unset:
      'users.$.card': ''

  wipeTable: (tableId) ->
    throw 'wtf' unless @userId
    check tableId, String
    table = Tables.findOne(_id: tableId, 'users.id': @userId)
    throw 'no table' unless table

    Tables.update tableId, $set:
      users: table.users.map((obj) -> id: obj.id)
      exposed: false
