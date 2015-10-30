class Skill < ActiveRecord::Base
  belongs_to :service
  has_many :masteries, dependent: :destroy
  has_many :experts, through: :masteries

  validates :name, presence: true, uniqueness: { case_sensitive: false,
                                                 scope: :service }
  validates :service_id, presence: true
end
