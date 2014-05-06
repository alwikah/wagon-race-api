require_relative './player'

class Game < ActiveRecord::Base
  # Status, Elapsed Time, Created_at, Updated_at

  has_many :players
  belongs_to :session

  has_one :winner, through: :player

  def to_hash
    {
      status: 200,
      session_id: self.session.id,
      game: {
        id: self.id,
        winner: self.winner,
        status: self.status,
        elapsed_time: self.elapsed_time || 0,
        players: self.players.collect { |player| { id: player.id, name: player.name } }
      }
    }
  end
end
