class Child < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :milestones, through: :assignments

  validates :name, presence: true
  validates :born_at, presence: true
  validates_date :born_at, on_or_before: lambda { Date.today }
  
  def reload_assignments!
    Milestone.where("breakpoint_day < ?", age_in_days)
  end

  def age_in_days
    (Date.today - born_at).to_i
  end
end
