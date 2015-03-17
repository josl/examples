
//Render Page
Page = React.createClass({
  render: function(){return (
    React.DOM.div({},
    //AddPlayer({players: this.props.players}),
    ListFixtures({fixturesList: this.props.fixturesList}), //don't forget to include the key before the ':' here. 
    Standings({fixturesList: this.props.fixturesList})
    )
  )},
})


//List all played fixtures
ListFixtures = React.createClass({
  render: function(){
    return(React.DOM.div({className: 'fixturesList'}, this.props.fixturesList.map(
        function(fix){
         return React.DOM.div({className: 'fixture'}, [fix.bcons, ' ',
           fix.bscore, '-', fix.yscore, ' ', fix.ycons])}
    )))
  }
})

//update standings
Standings = React.createClass({
  render: function(){
    var updatedRecords = update(this.props.fixturesList)
    var sortedRecords = updatedRecords.sort(standingSort)
    heading = React.DOM.tr({},[React.DOM.th({},'Player'), React.DOM.th({},'Wins'), React.DOM.th({},'Losses')])    
    return React.DOM.table({},[heading, sortedRecords.map(StandingRow)]) //
  }
})

StandingRow = React.createClass({
  render: function(){
    return React.DOM.div({}, 'Standings', React.DOM.tr({}, [React.DOM.td({},this.props.player), React.DOM.td({},this.props.wins), React.DOM.td({},this.props.losses)]))
  }
})

//sort players by record
function standingSort(a,b){                
  switch(true){
    case a.wins  > b.wins: return 1;
    case a.wins  < b.wins: return -1;
    case a.losses < b.losses: return 1;
    case a.losses > b.losses: return -1;
    default: return (a.player).localeCompare(b.player);    
  }
}

update = function (fixtures) {
  var standings ={}
  for (i in fixtures){
    var fix = fixtures[i]
    if (!standings[fix.bcons]) standings[fix.bcons] = {wins: 0, losses: 0}
    if (!standings[fix.ycons]) standings[fix.ycons] = {wins: 0, losses: 0}
    if (fix.bscore == 10){
      var winner = fix.bcons
      var loser = fix.ycons
    }
    else if (fix.yscore == 10){
      var winner = fix.ycons
      var loser = fix.bcons
    } else if(true) throw 'wtf';
    standings[winner].wins++
    standings[loser].losses++
  }
  return Object.keys(standings).map(function(player){
    return({player: player, wins: standings[player].wins, losses: standings[player].losses})
  })
}

