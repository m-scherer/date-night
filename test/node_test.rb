require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

class NodeTest < Minitest::Test

  def test_it_has_a_score
    node = Node.new({ :score => 61, :title => "Bill & Ted's Excellent Adventure" })

    refute node.score.nil?
  end

  def test_if_it_has_a_title
    node = Node.new({ :score => 61, :title => "Bill & Ted's Excellent Adventure" })

    refute node.title.nil?
  end

  def test_it_has_a_left_link
    node = Node.new({ :score => 61, :title => "Bill & Ted's Excellent Adventure" })

    refute node.left_link.nil?
  end

  def test_it_has_a_right_link
    node = Node.new({ :score => 61, :title => "Bill & Ted's Excellent Adventure" })

    refute node.right_link.nil?
  end
end
