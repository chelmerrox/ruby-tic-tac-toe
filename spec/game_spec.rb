# rubocop:disable Layout/LineLength

require_relative '../lib/game.rb'

describe Game do
  let(:game_win_1) { Game.new }
  describe '#winning_board' do
    it '[] expected to return [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]' do
      expect(game_win_1.winning_board([])).to eql([[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]])
    end
  end
  describe '#check_winner' do
    it "['X', 'X', 'X', 3, 4, 5, 6, 7, 8] expected to return true" do
      expect(game_win_1.check_winner?(['X', 'X', 'X', 3, 4, 5, 6, 7, 8])).to eql(true)
    end
    it "['X', 'X', 'O', 3, 4, 5, 6, 7, 8] expected to return false" do
      expect(game_win_1.check_winner?(['X', 'X', 'O', 3, 4, 5, 6, 7, 8])).to eql(false)
    end
  end
  describe '#check_draw' do
    let(:game_draw_1) { Game.new }
    it "['X', 'X', 'O', 3, 4, 5, 6, 7, 8] expected to return false" do
      expect(game_draw_1.check_draw?(['X', 'X', 'O', 3, 4, 5, 6, 7, 8])).to eql(false)
    end
    it "['X', 'O', 'X', 3, 'O', 'X', 'O', 'X', 'O'] expected to return true" do
      expect(game_draw_1.check_draw?(['X', 'O', 'X', 3, 'O', 'X', 'O', 'X', 'O'])).to eql(true)
    end
  end
end
# rubocop:enable Layout/LineLength
