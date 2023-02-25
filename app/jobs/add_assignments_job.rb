class AddAssignmentsJob < ApplicationJob
  queue_as :default

  def perform(child_id)
    child = Child.find(child_id)
    child.reload_assignments!
  end
end
