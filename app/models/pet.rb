class Pet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to :user
  has_one_attached :image

  validates :petname, presence: true
  validates :gender_id, presence: true, numericality: { other_than: 0 }
end
