class Node
  attr_accessor :data, :next_node
  def initialize(data = nil, next_node = nil)
    @next_node = next_node
    @data = data
  end
end

class LinkList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head == nil
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = @tail.next_node
    end
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
      location = @head
      @head = Node.new(data, location)
    end
  end

  def size
    return 0 if @head.nil?
    location = @head
    count = 0
    until location == nil
      count += 1
      location = location.next_node
    end
    return count
  end

  def at(index)
    location = @head
    count = 0
    until count == index
      return if location.next_node == nil
      location = location.next_node
      count += 1
    end
    location
  end

  def pop
    location = @head
    until location.next_node == @tail
      location = location.next_node
    end
    location.next_node = nil
    @tail = location
  end

  def contains?(data)
    location = @head
    until location == nil
      return true if location.data == data
      location = location.next_node
    end
    return false
  end

  def find(data)
    count = 0
    location = @head
    while location != nil
      if location.data == data
        print "'#{data}' is located at index #{count}"
        return count
      end
      location = location.next_node
      count += 1
    end
    print "No record of '#{data}' in the list"
    return nil

  end

  def to_s
    location = @head
    until location == nil
      print "( #{location.data} ) -> "
      location = location.next_node
    end
    print "nil\n"
  end

  def insert_at(data, index)

    location = @head
    count = 0
    until count == (index - 1)
      count += 1
      location = location.next_node
    end
    if location.next_node == nil
      location.next_node = Node.new(data)
      @tail = location.next_node
    else
      location.next_node = Node.new(data, location.next_node)
    end

  end

  def remove_at(index)
    if (index > self.size)
      puts "Error: That node doesn't exist."
    elsif (index == self.size)
      self.pop
    elsif index == 0
      location = @head.next_node
      @head = location
    else
      node_to_remove = self.at(index)
      connection = node_to_remove.next_node
      previous_node = self.at(index-1)
      previous_node.next_node = connection
    end
  end
end

websites = LinkList.new
websites.append("Google")
websites.prepend("bbcnews")
websites.append("facebook")
websites.prepend("skynews")
puts websites.tail.data
puts websites.head.data
websites.pop
puts websites.size
websites.to_s
puts websites.at(2).data
puts websites.contains?("Google")
puts websites.contains?("bbc2")
puts websites.find("Google")
websites.insert_at("reddit",2)
websites.to_s
websites.remove_at(3)
websites.to_s
