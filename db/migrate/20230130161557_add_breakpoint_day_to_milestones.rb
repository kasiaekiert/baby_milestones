class AddBreakpointDayToMilestones < ActiveRecord::Migration[7.0]
  def change
    add_column :milestones, :breakpoint_day, :integer, null: false
  end
end
