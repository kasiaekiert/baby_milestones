require "test_helper"

class ChildTest < ActiveSupport::TestCase
  test "child should have name" do
    child = Child.new(name: "")
    assert_not child.valid?
  end
end
