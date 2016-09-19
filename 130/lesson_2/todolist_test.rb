require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo )
    assert_equal(2, @list.size)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal(2, @list.size)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_wrong_type_added
    assert_raises(TypeError) do
      @list.add(String.new)
    end
  end

  def test_alias_add
    todo = Todo.new("Test")
    assert_equal(4, (@list << todo).size)
  end

  def test_item_at
    assert_raises(IndexError) do
      @list.item_at(100)
    end
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
    assert_equal(true, @list.mark_done_at(0))
  end

  def test_mark_undone_at
    assert_equal(false, @list.mark_undone_at(0))
  end

  def test_done_list
     @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(788)
    end
    assert_equal(@todo1, @list.remove_at(0))
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_two_done_to_s
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end


  def test_all_done_to_s
    @list.mark_done_at(0)
    @list.mark_done_at(1)
    @list.mark_done_at(2)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each_iterates
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_orginal
    assert_equal(@list, @list.each{|todo| nil})
  end

  def test_select
    @list.mark_done_at(0)
    assert_equal(1, @list.select{|todo| todo.done? }.size)
  end

end