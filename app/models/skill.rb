class Skill < ActiveRecord::Base
  belongs_to :service
  has_many :masteries
  has_many :experts, through: :masteries

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
