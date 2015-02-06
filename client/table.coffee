Template.tableView.helpers
  hand: -> [1, 2, 3, 5, 8, 13].map (number) -> { number }

  isSelected: (number) ->
    Template.parentData().users.some (obj) =>
      obj.id is Meteor.userId() and obj.card is @number

Template.tableView.events
  'click .hand .selected.card': (evt) ->
    Meteor.call 'revokeCard', Session.get('tableId')
    evt.stopImmediatePropagation()

  'click .hand .card': ->
    Meteor.call 'playCard', Session.get('tableId'), @number

  'click #home': ->
    Session.set 'tableId', null

  'click #leave': ->
    Meteor.call 'leaveTable', Session.get('tableId')
    Session.set 'tableId', null

  'click #wipe': ->
    Meteor.call 'wipeTable', Session.get('tableId')
