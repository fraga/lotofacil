class Loterias::LotofacilController < ApplicationController
  def index

  end

  def latest
    @latestgame = ApplicationHelper::GameRequest.get_games('http://www1.caixa.gov.br/mobile/loterias/asp/lotofacil_pok.asp')

    respond_to do |format|
      format.xml { render :xml => @latestgame }
      format.json { render :json => @latestgame }
      format.html { render :html => @latestgame}
    end
  end

  def show
    @lotofacil = LotoFacilGame.where(:gameid => params[:id])

    respond_to do |format|
      format.xml { render :xml => @lotofacil }
    end

  end

end
