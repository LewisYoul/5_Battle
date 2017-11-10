class Game
  attr_reader :player1, :player2, :turn, :attacked_player

  def self.start(game_instance)
    @at_start = game_instance
  end

  def self.read
    @at_start
  end


  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def attack
    if @turn == 1
      attack_player(@player2)
      swap_turn
    else
      attack_player(@player1)
      swap_turn
    end
  end

  private

  def attack_player(player)
    player.reduce_hp
    @attacked_player = player.name
  end

  def swap_turn
    @turn == 1 ? @turn = 2 : @turn = 1
  end
end
