div = React.DOM.div
ul  = React.DOM.ul
li  = React.DOM.li

recl = React.createClass

//Render Page
Page = recl({
  render: function(){return (
    div({},
    //AddPlayer({players: this.props.players}),
    Fixtures({fixturesList:this.props.fixturesList}), //don't forget to include the key before the ':' here. 
    Standings({fixturesList:this.props.fixturesList})
    )
  )},
})

//List all played fixtures
Fixtures = recl({
  render: function(){
    return (ul({className:'fixturesList'}, this.props.fixturesList.map(Fixture)))
  }
})

Fixture = recl({
  render: function() {
    return li({className:'fixture'}, 
            [div({className:'contestant'}, fix.bcons), ' ',
             div({className:'score'}, fix.bscore), '-', 
             div({className:'score'}, fix.yscore), ' ', 
             div({className:'contestant'}, fix.ycons)])}
  }
})

//update standings
Standings = recl({
  render: function(){
    var updatedRecords = fixturesToStandings(this.props.fixturesList)
    var sortedRecords = updatedRecords.sort(standingSort)
    heading = li({},
      [div({},'Player'), 
       div({},'Wins'), 
       div({},'Losses')])
    return ul({className:"standings"},[heading, sortedRecords.map(Standing)]) //
  }
})

Standing = recl({
  render: function(){
    return li({},
      [div({},this.props.player), 
       div({},this.props.wins), 
       div({},this.props.losses)])
  }
})

//sort players by record
standingSort = function (a,b){                
  switch(true){
    case a.wins  > b.wins: return 1;
    case a.wins  < b.wins: return -1;
    case a.losses < b.losses: return 1;
    case a.losses > b.losses: return -1;
    default: return (a.player).localeCompare(b.player);
  }
}


fixturesToStandings = function (fixtures) {
  var standings ={}
  for (i in fixtures){
    var fix = fixtures[i]
    if (!standings[fix.bcons]) standings[fix.bcons] = {wins:0, losses:0}
    if (!standings[fix.ycons]) standings[fix.ycons] = {wins:0, losses:0}
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
    return({player:player, wins:standings[player].wins, losses:standings[player].losses})
  })
}

