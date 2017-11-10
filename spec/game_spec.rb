require 'game'

describe Game do

  let(:player1) { double(:player1, reduce_hp: true, name: true) }
  let(:player2) { double(:player2, reduce_hp: true, name: true) }
  let(:game1) { described_class.new(player1, player2) }

  describe "#attack" do
    context "when attacking" do
      it "calls player.reduce_hp" do
        expect(game1.turn).to eq(1)
      end
      it "should be turn 2" do
        game1.attack
        expect(game1.turn).to eq(2)
      end
    end
  end

end
