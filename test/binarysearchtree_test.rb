require "minitest/autorun"
require "minitest/pride"
require "./lib/binarysearchtree"
require "pry"

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new()
    @node_1_score = 61
    @node_1_title = "Bill & Ted's Excellent Adventure"
    @node_2_score = 16
    @node_2_title = "Johnny English"
    @node_3_score = 92
    @node_3_title = "Sharknado 3"
    @node_4_score = 50
    @node_4_title = "Hannibal Buress: Animal Furnace"
    @node_5_score = 80
    @node_5_title = "Star Wars"
  end

  def test_if_root_node_created
    @tree.insert(@node_1_score,@node_1_title)

    assert_equal Node, @tree.root.class
  end

  def test_if_root_node_data_correct
    @tree.insert(@node_1_score,@node_1_title)

    assert_equal 61, @tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", @tree.root.title
  end

  def test_if_node_inserted_right
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_3_score,@node_3_title)
    assert_equal Node, @tree.root.right_link.class
  end

  def test_if_node_inserted_left
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)

    assert_equal Node, @tree.root.left_link.class
  end

  def test_if_node_inserted_level_2
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)

    assert_equal Node, @tree.root.left_link.class
  end

  def test_if_depth_is_being_populated
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)

    assert_equal 0, @tree.root.depth
  end

  def test_find_node_depth
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)

    assert_equal 0, @tree.depth_of(61)
    assert_equal 1, @tree.depth_of(16)
    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
  end

  def test_is_node_included
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)
    @tree.insert(@node_5_score,@node_5_title)

    assert_equal true, @tree.include?(61)
    assert_equal true, @tree.include?(16)
    assert_equal true, @tree.include?(92)
    assert_equal true, @tree.include?(50)
    assert_equal true, @tree.include?(80)

  end

  def test_what_is_max
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)
    @tree.insert(@node_5_score,@node_5_title)

    assert_equal 92, @tree.max
  end

  def test_what_is_min
    @tree.insert(@node_1_score,@node_1_title)
    @tree.insert(@node_2_score,@node_2_title)
    @tree.insert(@node_3_score,@node_3_title)
    @tree.insert(@node_4_score,@node_4_title)
    @tree.insert(@node_5_score,@node_5_title)

    assert_equal 16, @tree.min
  end

  def test_did_it_load
    @tree.insert(@node_1_score,@node_1_title)
    @tree.load
    assert_equal 0, @tree.depth_of(61)
  end

  def test_how_many_were_loaded
    @tree.load
    assert_equal 99, @tree.load
  end


  # def test_is_it_sorted
  #   @tree.insert(@node_1_score,@node_1_title)
  #   @tree.insert(@node_2_score,@node_2_title)
  #   @tree.insert(@node_3_score,@node_3_title)
  #   @tree.insert(@node_4_score,@node_4_title)
  #   @tree.insert(@node_5_score,@node_5_title)
  #   @tree.sort
  #   assert_equal  [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}], @tree.sort
  # end

end
