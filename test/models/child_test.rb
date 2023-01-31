require "test_helper"

class ChildTest < ActiveSupport::TestCase
  test "child should have name" do
    child = Child.new(name: "", born_at: 2.days.ago)
    assert_not child.valid?
  end

  test "child should have born date" do
    child = Child.new(name: "John", born_at: "")
    assert_not child.valid?
  end

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
end
