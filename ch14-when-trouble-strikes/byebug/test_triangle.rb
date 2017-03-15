require 'minitest/autorun'
require_relative 'triangle.rb'

class TestTriangle < Minitest::Test
  def test_basic
    byebug

    solutions = []

    0.upto(5) { |i| solutions << triangle(i) }

    assert_equal([0, 1, 3, 6, 10, 15], solutions, 'First 5 triangle numbers')
  end
end
