class List < ApplicationRecord
  # A list can have many bookmarks. If a list is deleted, its bookmarks are also deleted
  has_many :bookmarks, dependent: :destroy

  # A list can have many movies through bookmarks
  has_many :movies, through: :bookmarks

  # A list must have a unique name
  validates :name, presence: true, uniqueness: true
end
 #In the List model, has_many :bookmarks, dependent: :destroy sets up a one-to-many relationship with bookmarks,
 #and ensures that when a list is deleted, all associated bookmarks are also deleted.
 #has_many :movies, through: :bookmarks sets up a many-to-many relationship with movies through bookmarks.
 #The validates line ensures that every list must have a uniqu
