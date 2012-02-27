class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  play = [game[0][1].downcase, game[1][1].downcase]

  raise NoSuchStrategyError if play[0].index(/[rps]/).nil?
  raise NoSuchStrategyError if play[1].index(/[rps]/).nil?

  return game[0] if play[0] == play[1] 

  if play == ["r","s"] || play == ["p","r"] || play == ["s","p"]
    return game[0]
  else
    return game[1]
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    return rps_game_winner(tournament)
  else
    rps_tournament_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end

=begin
 game = [ [ "Armando", "P" ], [ "Dave", "S" ] ] 
 puts rps_game_winner(game).inspect

 game = [ [ "Armando", "P" ], [ "Dave", "R" ] ] 
 puts rps_game_winner(game).inspect

 game = [ [ "Armando", "S" ], [ "Dave", "R" ] ] 
 puts rps_game_winner(game).inspect

 tournament = [ [ [ ["Armando", "P"], ["Dave", "S"] ], [ ["Richard", "R"],  ["Michael", "S"] ], ], [ [ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ] ]
 puts rps_tournament_winner(tournament).inspect
=end
