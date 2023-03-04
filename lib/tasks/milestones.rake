namespace :milestones do
  namespace :assignments do
    desc "Assign adequate milestones to children"
    task :generate => :environment do
      Child.all.each do |child|
        # FIXME: Change to rails logger
        puts("Scheduling assignments for #{child.name} (#{child.id})")
        AddAssignmentsJob.perform_later(child.id)
      end
    end
  end
end