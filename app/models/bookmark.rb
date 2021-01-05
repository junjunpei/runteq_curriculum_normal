class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user_id, uniqueness: { scope: :board_id }

  paginates_per 20
end
