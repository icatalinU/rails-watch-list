class Bookmark < ApplicationRecord

  # a bookmark will belong to a movie and a list
  belongs_to :movie
  belongs_to :list

  # Validators for the bookmarks
  # a bookmark must have a minimum of 6 characters
  # can be bookmarket only if is in the same list   .... we use scope:list  to put this condtion

  validates :comment, length:{minimum: 6}
  validates :movie , uniqueness: {scope: :list }

end

 #     In the Bookmark model,   belongs_to :movie and belongs_to :list set up many-to-one relationships,
 #     meaning a bookmark belongs to one movie and one list.

 #     The validates lines ensure that every bookmark must have a comment of at least 6 characters,
 #      and that a movie can only be bookmarked once in the same list.
