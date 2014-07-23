class GamesController < ApplicationController
  def index
    session = Session.find(params[:id])

    render json: session.to_hash
  end

  def show
    game = Game.find(params[:id])

    render json: game.to_hash
  end

  def create
    session_id = params[:id]

    game = Game.create(session_id: session_id)

    params[:players].each do |player|
      game.players.find_or_create_by(name: player[:name])
      game.save!
    end

    render json: game.to_hash
  end

  def finish
    game = Game.find(params[:id])

    game.status = 'completed'
    game.winner_id = Player.find(params[:winner]).id
    game.elapsed_time = params[:elapsed_time]
    game.save!

    render json: game.to_hash
  end
end
