class Rank < ActiveRecord::Base
  belongs_to :player
  belongs_to :sport

  validates_presence_of :player
  validates_presence_of :sport

  validates_presence_of :value
  
  def self.for_sport(sport)
    where("ranks.sport_id = ?", sport)
  end
  
  def self.current_ranks
    joins("inner join (select max(id) as id, player_id, sport_id from ranks group by player_id, sport_id) r2 on ranks.id = r2.id")
  end

end
