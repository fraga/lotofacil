
class LotoFacilGame < ActiveRecord::Base
  before_save

  validates_presence_of(:n1, :n2, :n3, :n4, :n5, :n6, :n7, :n8, :n9, :n10, :n11, :n12, :n13, :n14, :n15)

  def self.get_latest_game
    GameRequest.get_games('http://www1.caixa.gov.br/mobile/loterias/asp/lotofacil_pok.asp')
  end

end
