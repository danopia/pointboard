atTable = (userId, doc) ->
  doc.users.some (user) -> user.id is userId

Meteor.startup ->
  Tables.allow
    insert: (userId, doc) -> userId isnt null
    update: atTable
    remove: atTable
