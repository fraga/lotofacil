class CreateLotoFacilGames < ActiveRecord::Migration
  def self.up
    create_table :loto_facil_games do |t|
      t.string 'n1'
      t.string 'n2'
      t.string 'n3'
      t.string 'n4'
      t.string 'n5'
      t.string 'n6'
      t.string 'n7'
      t.string 'n8'
      t.string 'n9'
      t.string 'n10'
      t.string 'n11'
      t.string 'n12'
      t.string 'n13'
      t.string 'n14'
      t.string 'n15'
      t.text 'hash'
      t.timestamps
    end
  end

  def self.down
    drop_table :loto_facil_games
  end
end
