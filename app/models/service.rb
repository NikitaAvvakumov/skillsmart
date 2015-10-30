class Service < ActiveRecord::Base
  has_many :skills

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
