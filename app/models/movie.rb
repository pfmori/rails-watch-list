class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true

  has_many :bookmarks
  has_many :lists, through: :bookmarks

  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    if bookmarks.any?
      errors.add(:base, 'Cannot delete movie with associated bookmarks')
      throw :abort
    end
  end
end
