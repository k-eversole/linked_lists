# frozen_string_literal: true

require_relative 'node'

# Class repesenting all of the nodes in the Linked List
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    new_node = Node.new(data)
    self.head = new_node if head.nil?
    self.tail = new_node if tail.nil?

    tail.next_node = new_node
    self.tail = new_node
  end

  def prepend(data)
    new_node = Node.new(data, head)
    self.head = new_node
    self.tail = new_node if head.nil?
  end

  def size
    size = 0
    return size if head.nil?

    current_node = head
    size += 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      size += 1
    end
    size
  end

  def at(index)
    return if head.nil?

    current_node = head
    index.times do
      return if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    popped = tail
    current_node = head
    current_node = current_node.next_node until current_node.next_node == tail
    self.tail = current_node
    current_node.next_node = nil
    popped
  end

  def contains?(value)
    current_node = head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return nil unless contains?(value)

    index = 0
    current_node = head
    until current_node.value == value
      index += 1
      current_node = current_node.next_node
    end
    index
  end

  def to_s
    str = ''
    current_node = head
    until current_node.nil?
      if current_node == head
        str += "#{head.value}"
      else
        str += " -> #{current_node.value}"
      end
      current_node = current_node.next_node
    end
    str += ' -> nil'
    puts str
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
    elsif index == size - 1
      append(value)
    else
      before = at(index - 1)
      after = at(index)
      new_node = Node.new(value, after)
      before.next_node = new_node
    end
  end

  def remove_at(index)
    if index - 1 > size
      puts 'There is not a node at this index.'

    else
      before = at(index - 1)
      to_delete = at(index)
      after = at(index + 1)
      to_delete.next_node = nil
      if index.zero?
        self.head = after
      elsif index == size
        self.tail = before.next_node
        tail.next_node = nil
      else
        before.next_node = after
      end
    end
  end
end
