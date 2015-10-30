class Mastery < ActiveRecord::Base
  belongs_to :skill
  belongs_to :expert

  validates :skill, presence: true
  validates :expert, presence: true
  validates :description, length: { maximum: 250 }
end
