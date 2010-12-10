class LotoFacilController < ApplicationController
  def index

  end

  def nogames

  end

  def latest
    @latestgame = ApplicationHelper::GameRequest.get_games('http://www1.caixa.gov.br/mobile/loterias/asp/lotofacil_pok.asp')

    respond_to do |format|
      format.xml { render :xml => @latestgame }
      format.json { render :json => @latestgame }
      format.html { render :html => @latestgame}
    end
  end

  def all
    @lotofacil = LotoFacilGame.all

    redirect_to('index') unless @lotofacil != nil

    respond_to do |format|
      format.xml { render :xml => @lotofacil }
    end
  end

  def game
    @lotofacil = LotoFacilGame.where(:gameid => params[:id])

    respond_to do |format|
      format.xml { render :xml => @lotofacil }
    end

  end

  
end
