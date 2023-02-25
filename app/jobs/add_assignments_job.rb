class AddAssignmentsJob < ApplicationJob
  queue_as :default

  def perform(child_id)
    puts "add assignment"
    binding.pry
    Child.find_by(child_id)
  end
end
