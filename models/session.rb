class Session < ActiveRecord::Base
  # Status, Elapsed Time, Created_at, Updated_at

  belongs_to :session
  has_one :winner, through: :player
end
