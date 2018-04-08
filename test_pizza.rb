require "minitest/autorun"
require_relative "pizza.rb"

class Pizza_Test < Minitest::Test

def test_bool
  assert_equal(true,true)
end
def test_hash_return
  assert_equal(Hash, menu_return["Sides"].class)
end

def test_hash_sides
  assert_equal({"Cheesesticks"=>6.5, "Breadsticks"=>6.5, "Wings"=>8.0}, menu_return["Sides"])
end

end
