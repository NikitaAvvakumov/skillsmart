class Mastery < ActiveRecord::Base
  belongs_to :skill
  belongs_to :expert

  validates :skill, presence: true
  validates :expert, presence: true
  validates :description, length: { maximum: 250 }
  validates :skill_id, uniqueness: { scope: :expert_id,
                                     message: "has already been added to your profile." }
end
