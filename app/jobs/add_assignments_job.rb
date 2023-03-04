class AddAssignmentsJob < ApplicationJob
  queue_as :default

  def perform(child)
    puts "add assignment"
    child.reload_assignments! if child
  end
end
