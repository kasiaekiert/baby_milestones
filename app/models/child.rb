class Child < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :milestones, through: :assignments

  validates :name, presence: true
  validates :born_at, presence: true
  validates_date :born_at, on_or_before: lambda { Date.today }
end
