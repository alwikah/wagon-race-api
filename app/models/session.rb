class Session < ActiveRecord::Base
  # Status, Elapsed Time, Created_at, Updated_at

  has_many :games

  def to_hash # Should use scopes
    {
      session_id: self.id,
      games: {
        started: self.games.where(status: 'started').collect { |g| g.id },
        completed: self.games.where(status: 'completed').collect { |g| g.id }
      }
    }
  end
end
