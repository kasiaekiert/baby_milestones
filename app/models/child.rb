class Child < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :milestones, through: :assignments
  has_many :assignments, dependent: :destroy
  
  validates :name, presence: true
  validates :born_at, presence: true
  validates_date :born_at, on_or_before: lambda { Date.today }
  
  def reload_assignments!
    logger.info("Reloading assignments for #{name.inspect} (#{id})")
    query = Milestone.where("breakpoint_day <= ?", age_in_days)
    last_milestone = milestones.order(breakpoint_day: :desc).first
    query = query.where("breakpoint_day > ?", last_milestone.breakpoint_day) if last_milestone
    query.each do |milestone|
      logger.info("Assigning #{milestone.title.inspect} (#{milestone.id}) to #{name.inspect} (#{id})")
      assignments.build(milestone: milestone)
    end
    save!
  end

  def age_in_days
    (Date.today - born_at).to_i
  end
end
