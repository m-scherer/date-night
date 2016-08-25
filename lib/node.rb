class Node
  attr_accessor :left_link, :right_link, :depth, :sorted
  attr_reader :score, :title

  def initialize(score, title)
    @score = score
    @title = title
    @left_link = nil
    @right_link = nil
    @sorted = false
  end

end
