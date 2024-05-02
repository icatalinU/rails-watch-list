class Movie < ApplicationRecord
  #here we will put the schema association

  # a movie can have many bookmarks
  has_many :bookmarks    ### this means has one to many relation    one movie has relation with many bookmarks

  # validators
  # a movie must have a unique title and a overview   otherwise we cann t continue
  validates :title, presence:true, uniqueness:true
  validates :overview, presence:true
end
