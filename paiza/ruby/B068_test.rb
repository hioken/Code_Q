require 'minitest/autorun'
require './B068_case_1.rb'
require './B068_case_2.rb'

class ChocoTest < Minitest::Test
  def setup
    @chocolate_map = [[3, 7, 4, 5, 1], [6, 9, 1, 8, 8], [11, 2, 5, 2, 2]]
  end
  def test_choco_1
    1000.times do
      assert_equal [["A", "A", "B", "B", "B"], ["A", "A", "A", "B", "B"], ["A", "B", "B", "B", "B"]], choco_1(@chocolate_map)
    end
  end
end

# 1, Finished in 1.762773s, 0.5673 runs/s, 567.2882 assertions/s.
# 1, Finished in 1.225088s, 0.8163 runs/s, 816.2682 assertions/s.

# 2, Finished in 1.214812s, 0.8232 runs/s, 823.1727 assertions/s.
# 2, Finished in 1.397159s, 0.7157 runs/s, 715.7379 assertions/s.
