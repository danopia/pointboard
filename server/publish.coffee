Meteor.publish null, ->
  Tables.find({}, {fields: {name: 1}}) if @userId

Meteor.publish null, ->
  Tables.find({'users.id': @userId}) if @userId
