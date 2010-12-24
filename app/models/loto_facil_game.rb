

class LotoFacilGame < ActiveRecord::Base

  #validates_presence_of(:game_id, :n1, :n2, :n3, :n4, :n5, :n6, :n7, :n8, :n9, :n10, :n11, :n12, :n13, :n14, :n15)
  #validates_uniqueness_of(:game_id)

  def self.get_latest_game(url)
      final_result = []
      #doc = Nokogiri::HTML(Iconv.conv('utf-8//IGNORE', 'ISO-8859-1', open(url).read))
      doc = Nokogiri::HTML(open(url))

      games_array = doc.xpath('//td[@class="txtdezena"]')

      games_array.each do |line|
        line.content.gsub(/\S+\w+\S+/, '-').split('-').each do |element|
          final_result << element.strip()
        end
      end
      final_result
  end

  def self.init_from_array(lotofacilgame_array)
    @lotofacilgame = LotoFacilGame.new
    #game info
    @lotofacilgame.game_id = lotofacilgame_array[0].strip.to_i
    @lotofacilgame.game_date= Date.strptime(lotofacilgame_array[1].strip, '%d/%m/%Y')

    #game numbers
    @lotofacilgame.n1 = lotofacilgame_array[2].strip
    @lotofacilgame.n2 = lotofacilgame_array[3].strip
    @lotofacilgame.n3 = lotofacilgame_array[4].strip
    @lotofacilgame.n4 = lotofacilgame_array[5].strip
    @lotofacilgame.n5 = lotofacilgame_array[6].strip
    @lotofacilgame.n6 = lotofacilgame_array[7].strip
    @lotofacilgame.n7 = lotofacilgame_array[8].strip
    @lotofacilgame.n8 = lotofacilgame_array[9].strip
    @lotofacilgame.n9 = lotofacilgame_array[10].strip
    @lotofacilgame.n10 = lotofacilgame_array[11].strip
    @lotofacilgame.n11 = lotofacilgame_array[12].strip
    @lotofacilgame.n12 = lotofacilgame_array[13].strip
    @lotofacilgame.n13 = lotofacilgame_array[14].strip
    @lotofacilgame.n14 = lotofacilgame_array[15].strip
    @lotofacilgame.n15 = lotofacilgame_array[16].strip

    #total amount received
    @lotofacilgame.total_amount_received = ApplicationHelper::format_number(lotofacilgame_array[17].strip)

    #game winners
    @lotofacilgame.winners_15 = lotofacilgame_array[18].strip
    @lotofacilgame.winners_14= lotofacilgame_array[19].strip
    @lotofacilgame.winners_13 = lotofacilgame_array[20].strip
    @lotofacilgame.winners_12= lotofacilgame_array[21].strip
    @lotofacilgame.winners_11 = lotofacilgame_array[22].strip

    #game winners division
    @lotofacilgame.amount_div_15 = ApplicationHelper::format_number(lotofacilgame_array[23].strip)
    @lotofacilgame.amount_div_14 = ApplicationHelper::format_number(lotofacilgame_array[24].strip)
    @lotofacilgame.amount_div_13 = ApplicationHelper::format_number(lotofacilgame_array[25].strip)
    @lotofacilgame.amount_div_12 = ApplicationHelper::format_number(lotofacilgame_array[26].strip)
    @lotofacilgame.amount_div_11 = ApplicationHelper::format_number(lotofacilgame_array[27].strip)

    #accumulated amount
    @lotofacilgame.amount_accumulated_15 = ApplicationHelper::format_number(lotofacilgame_array[28].strip)

    #prize estimation
    @lotofacilgame.amount_prize_estimate = ApplicationHelper::format_number(lotofacilgame_array[29].strip)

    @lotofacilgame
  end

  def self.update_all(url)
    
    file = open(url)

    if file != nil
      ApplicationHelper::unzip_file(file.path, Dir::tmpdir)

      doc = Nokogiri::HTML(open(Dir::tmpdir + '/D_LOTFAC.HTM'))

      table_rows = doc.xpath('//tr')

      table_rows.delete(table_rows.first)

      table_rows.each do |row|
        game_id = row.content.to_a[0].strip.to_i

        if LotoFacilGame.where(:game_id => game_id) == []
          LotoFacilGame.init_from_array(row.content.to_a).save
        end

      end

    end
  end

end
