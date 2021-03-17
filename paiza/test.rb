class Abc
  attr_accessor :num

  def initialize
    @num = num_count
  end

  def num_count
    5
  end
end

a = Abc.new
p a.num
