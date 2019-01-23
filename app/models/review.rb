require 'date'

class Review < ActiveRecord::Base
  belongs_to :restaurant

  def date
    Time.at(self.timestamp).utc.to_datetime
  end
end
