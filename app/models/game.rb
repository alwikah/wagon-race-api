class Game < ActiveRecord::Base
  # Status, Elapsed Time, Created_at, Updated_at

  has_many :players
  belongs_to :session

  def to_hash
    {
      session_id: self.session.id,
      game: {
        id: self.id,
        winner: winner_id,
        status: self.status,
        elapsed_time: self.elapsed_time || 0,
        players: self.players.collect { |player| { id: player.id, name: player.name } }
      }
    }
  end
end
