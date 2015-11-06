class Expert < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :masteries, dependent: :destroy
  has_many :skills, through: :masteries

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.search_by_skills(skills)
    joins(:skills).
      where(skills: { id: skills }).
      group("experts.id").
      having("count(*) = #{skills.size}")
  end
end
