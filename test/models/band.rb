class Band < ActiveRecord::Base
  validates_presence_of :name
  acts_as_filterable :by_country, :by_genre, :size
  
  scope :by_country, lambda {|c| where('country = ?', c)}
  
  def self.by_genre(genre)
    where('genre = ?', genre)
  end
end
