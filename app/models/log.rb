class Log < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :mood
  belongs_to :pet
  belongs_to :user

  validates :mood_id, presence: true, numericality: { other_than: 0 }
end
