require "test_helper"
require 'pry'

class ChildTest < ActiveSupport::TestCase
  test "child should have name" do
    child = Child.new(name: "", born_at: 2.days.ago)
    assert_not child.valid?
  end

  #add test to child model  

  test "child should have name and born date" do
    child = Child.new(name: "Emma", born_at: "")
    assert_not child.valid?
  end

  test "child should be born today" do
    child = Child.new(name: "Emma", born_at: Date.today)
    assert child.valid?
  end

  test "child should be born in the past" do
    child = Child.new(name: "John", born_at: Date.today - 2.days)
    assert child.valid?
  end

  test "child should not be born in the future" do
    child = Child.new(name: "John", born_at: Date.today + 2.days)
    assert_not child.valid?
  end
  
  test "list milestones assigned to the child" do
    child = Child.new(name: "John", born_at: 2.weeks.ago)
    child.reload_assignments!
    assert_equal child.assignments.count, 2
  end

  test "list milestones assigned to the younger" do
    child = Child.new(name: "John", born_at: 5.days.ago)
    child.reload_assignments!
    child.reload_assignments!
    assert_equal child.assignments.count, 1
  end

  test "test age_in_days" do
    expected_age_in_days = 14
    child = Child.new(name: "John", born_at: expected_age_in_days.days.ago)
    assert_equal child.age_in_days, expected_age_in_days 
  end
end
