class Child < ApplicationRecord
  has_many :milestones, through: :assignments
  has_many :assignments, dependent: :destroy
  
  validates :name, presence: true
  validates :born_at, presence: true
  validates_date :born_at, on_or_before: lambda { Date.today }
end
