class Player < ActiveRecord::Base
  # Name, Created_at, Updated_at

  belongs_to :game
end
