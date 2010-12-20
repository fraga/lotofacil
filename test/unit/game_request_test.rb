require "test/unit"

class GameRequestTest < Test::Unit::TestCase
  
  def setup
    #CaixaGameRequest.new()
  end

  def teardown
  end

  def test_games
    url = '../fixtures/loto_facil_latest_game.html'
    expected = ['02','03','04','06','08','09','10','12','13','20','21','22','23','24','25']
    result = GameRequest.get_games(url)
    assert_equal(expected, result)

  end

end