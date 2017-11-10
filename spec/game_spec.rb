require 'game'

describe Game do

  let(:player1) { double(:player) }
  let(:player2) { double(:player, reduce_hp: true) }
  let(:game1) { described_class.new("Lewis","Gabriela") }

  describe "#attack" do
    context "when attacking" do
      it "calls player.reduce_hp" do
        game1.attack(player2)
      end
    end

  end

end
