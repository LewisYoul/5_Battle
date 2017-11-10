require 'player'

describe Player do

  let(:player1) { described_class.new("Gabriela") }
  let(:player2) { described_class.new("Lewis") }

  describe "Attributes" do
    it "returns a name" do
      expect(player1.name).to eq("Gabriela")
    end
  end

  it "returns the hit points" do
    expect(player1.hp).to eq described_class::DEFAULT_HP
  end

  it "reduces player2 hit points" do
    allow(player2).to receive(:rand_attack).and_return 10
    expect { player2.reduce_hp }.to change { player2.hp }.by(-10)
  end
end
