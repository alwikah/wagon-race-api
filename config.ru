require 'rack'
require 'grape'
require_relative 'config/application'
require_relative 'models/session'
require_relative 'models/game'
require_relative 'models/player'

module WagonRace
  class API < Grape::API
    version 'v1', using: :header, vendor: 'lewagon'
    format :json

    get 'game/session/new' do
      session = Session.create()

      {
        status: 200,
        session_id: session.id
      }
    end # Creates a new session

    post '/game/session/:id/new' do
      session_id = params[:id]
      game = Game.create(session_id: session_id)
      params[:players].each do |player|
        game.players.build(name: player[:name])
        game.save!
      end

      game.to_hash
    end

    post '/game/:id/results' do
      game_id = params[:id]
      game = Game.find(game_id)
      game.status = 'completed'
      game.player_id = Player.find(params[:winner]).id
      game.elapsed_time = params[:elapsed_time]
      game.save!

      game.to_hash
    end
  end
end

run WagonRace::API
