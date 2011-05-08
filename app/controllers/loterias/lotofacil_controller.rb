class Loterias::LotofacilController < ApplicationController
  def index

  end

  def process_all_games
    begin
      LotoFacilGame.update_all('http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_lotfac.zip')
      @message = 'ok'
    rescue Exception => exc
      @message = exc.message
    end

  end

  def latest
    begin
      @latestgame = LotoFacilGame.get_latest_game('http://www1.caixa.gov.br/mobile/loterias/asp/lotofacil_pok.asp')
    rescue Exception => exc
      
    end


    respond_to do |format|
      format.xml { render :xml => @latestgame }
      format.json { render :json => @latestgame }
      format.html { render :html => @latestgame}
    end
  end

  def last
    @latestgame = LotoFacilGame.maximum(:game_date)

    respond_to do |format|
      format.xml { render :xml => @lotofacil }
      format.json { render :json => @lotofacil }
      format.html { render :html => @lotofacil }
    end

  end

  def show
    @lotofacil = LotoFacilGame.where(:game_id => params[:id]).first

    respond_to do |format|
      format.xml { render :xml => @lotofacil }
      format.json { render :json => @lotofacil }
      format.html { render :html => @lotofacil }
    end

  end

end
