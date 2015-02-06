Template.root.helpers
  table: -> Tables.findOne
    _id: Session.get('tableId')
    pin: $exists: true
