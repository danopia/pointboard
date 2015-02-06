Template.tableView.helpers
  hand: -> [1, 2, 3, 5, 8, 13].map (number) -> { number }

Template.tableView.events
  'click .hand li': ->
    Meteor.call 'playCard', Session.get('tableId'), @number

  'click #home': ->
    Session.set 'tableId', null

  'click #leave': ->
    Meteor.call 'leaveTable', Session.get('tableId')
    Session.set 'tableId', null

  'click #wipe': ->
    Meteor.call 'wipeTable', Session.get('tableId')
