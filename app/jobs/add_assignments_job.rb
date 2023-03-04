class AddAssignmentsJob < ApplicationJob
  queue_as :default

  def perform(child_id)
    puts "add assignment"
    child = Child.find_by(child_id)
    child.reload_assignments! if child
  end
end
