class AddDetailsToLotoFacilGames < ActiveRecord::Migration
  def self.up
    add_column :loto_facil_games, :game_id, :integer
    add_column :loto_facil_games, :game_date, :datetime
    add_column :loto_facil_games, :winners_15, :integer
    add_column :loto_facil_games, :winners_14, :integer
    add_column :loto_facil_games, :winners_13, :integer
    add_column :loto_facil_games, :winners_12, :integer
    add_column :loto_facil_games, :amount_div_15, :decimal
    add_column :loto_facil_games, :amount_div_14, :decimal
    add_column :loto_facil_games, :amount_div_13, :decimal
    add_column :loto_facil_games, :amount_div_12, :decimal
    add_column :loto_facil_games, :amount_div_11, :decimal
    add_column :loto_facil_games, :amount_accumulated_15, :decimal
    add_column :loto_facil_games, :amount_prize_estimate, :decimal

    add_index :loto_facil_games, :game_id
    add_index :loto_facil_games, :id
  end

  def self.down
    remove_index :loto_facil_games, :id
    remove_index :loto_facil_games, :game_id

    remove_column :loto_facil_games, :game_id, :integer
    remove_column :loto_facil_games, :game_date, :datetime
    remove_column :loto_facil_games, :winners_15, :integer
    remove_column :loto_facil_games, :winners_14, :integer
    remove_column :loto_facil_games, :winners_13, :integer
    remove_column :loto_facil_games, :winners_12, :integer
    remove_column :loto_facil_games, :amount_div_15, :decimal
    remove_column :loto_facil_games, :amount_div_14, :decimal
    remove_column :loto_facil_games, :amount_div_13, :decimal
    remove_column :loto_facil_games, :amount_div_12, :decimal
    remove_column :loto_facil_games, :amount_div_11, :decimal
    remove_column :loto_facil_games, :amount_accumulated_15, :decimal
    remove_column :loto_facil_games, :amount_prize_estimate, :decimal
  end
end
