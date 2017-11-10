class Player
  attr_reader :name, :hp

  DEFAULT_HP = 100

  def initialize(name = nil,hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def reduce_hp
    @hp -= rand_attack
  end

  def rand_attack
    rand(1..30)
  end
end
