require_relative '../lib/player.rb'

describe Player do
  let(:new_player) { Player.new('John', 'X') }
  describe '#player' do
    it '"John" expected to return "John"' do
      expect(new_player.name).to eql('John')
    end
  end
  describe '#additional_method' do
    it '1 expected to return 1' do
      expect(new_player.additional_method).to eql(nil)
    end
  end
end
