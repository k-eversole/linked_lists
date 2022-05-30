# frozen_string_literal: true

# Class for nodes in linked list
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
