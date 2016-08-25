require "./lib/node"
require "pry"

class BinarySearchTree
  attr_reader :root, :counter

  #initialize
  def initialize()
    @root = nil
    @current_node = nil
  end


  def insert(score, title)
    #create instance
    new_node = Node.new(score, title)
    #does the root exist?
    if @root == nil
    #if no, create the root
      new_node.depth = 0
      @root = new_node

    else
    #if yes, find way to bottom
      depth = 1
      insert_traverse(@root, new_node, depth)
    end
  end

  def insert_traverse(current_node, new_node, depth)
    #does current_node have a right link and is it's score < new_node.score
    if current_node.right_link.nil? && current_node.score < new_node.score
      #if true: set the link to the new_node
      new_node.depth = depth
      current_node.right_link = new_node
      #does current_node have a left link and is it's score < new_node.score
    elsif current_node.left_link.nil? && current_node.score > new_node.score
      #if true: set the link to the new_node
      new_node.depth = depth
      current_node.left_link = new_node

      #if the right_link isn't the bottom
    elsif current_node.right_link != nil && current_node.score < new_node.score
      #set current_node = the right_link
      current_node = current_node.right_link
      depth += 1

      #start over
      insert_traverse(current_node, new_node, depth)
      #if the left_link isn't the bottom
    elsif current_node.left_link != nil && current_node.score > new_node.score
      #set current_node = the left_link
      current_node = current_node.left_link
      depth += 1

      #start over
      insert_traverse(current_node, new_node, depth)
    end
  end

  def depth_of(input_score)
    if @root.score == input_score
      return @root.depth
    else
      depth_traverse(input_score, @root)
    end
  end

  def depth_traverse(input_score, depth_node)
    if depth_node.score == input_score
      return depth_node.depth

    elsif input_score < depth_node.score
      depth_node = depth_node.left_link

      depth_traverse(input_score, depth_node)
    elsif input_score > depth_node.score
      depth_node = depth_node.right_link

      depth_traverse(input_score, depth_node)
    end
  end

  def include?(input_score)
    if depth_of(input_score) != nil
      true
    else
      false
    end
  end

  def max
    max_node = @root
    max_traverse(max_node)
  end

  def max_traverse(max_node)
    if max_node.right_link.nil?
      max_node.score
    else
      max_node = max_node.right_link
      max_traverse(max_node)
    end
  end

  def min
    min_node = @root
    min_traverse(min_node)
  end

  def min_traverse(min_node)
    if min_node.left_link.nil?
      min_node.score
    else
      min_node = min_node.left_link
      min_traverse(min_node)
    end
  end

  def load
    f = File.open("/Users/michaelscherer/turing/1module/date-night/movies.txt")
    f_lines = f.read.split("\n")

    movie_lines = f_lines.map do |line|
      line = line.split(", ")
      if line.length > 2
        title = line[1..-1].join(", ")
        line = [line[0], title]
      end
       line = [line[0].to_i, line[1]]
    end
    counter = 0
    movie_lines.each do |movie_line|
      #remove dupes -> if movie_line[0] exists in tree, ignore else insert
      insert(movie_line[0], movie_line[1])
      counter += 1
    end
    return counter
  end

  def sort
    sort_node = @root
    sorted_collect = Array.new
    sort_traverse(sort_node, sorted_collect)
  end

  def sort_traverse(sort_node, sorted_collect)
    binding.pry
    if sort_node.left_link == nil && sort_node.sorted == false
      sorted_collect = sorted_collect << {sort_node.score => sort_node.title}
      sort_node.sorted = true
      return sorted_collect
    elsif sort_node.right_link == nil && sort_node.sorted == false
      sorted_collect = sorted_collect << {sort_node.score => sort_node.title}
      sort_node.sorted = true
      return sorted_collect
    elsif sort_node.left_link == nil && sort_node.sorted == true
      sort_node = sort_node.right_link

      sort_traverse(sort_node, sorted_collect)

    elsif sort_node.left_link.nil? == false
      sort_node = sort_node.left_link

      sort_traverse(sort_node, sorted_collect)

    elsif sort_node.right_link.nil? == false
      sort_node = sort_node.right_link

      sort_traverse(sort_node, sorted_collect)
    end
  end


end
