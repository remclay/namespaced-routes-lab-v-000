class Preference < ActiveRecord::Base
  validates :artist_sort_order, :song_sort_order, presence: true
  validates_inclusion_of :allow_create_artists, :allow_create_songs, :in => [true, false]
end
