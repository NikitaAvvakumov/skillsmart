class Expert < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
