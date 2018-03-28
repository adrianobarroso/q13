class Fish
  attr_accessor :array
  attr_reader :id, :origin, :color

  @@array = []

  def initialize(attr = {})
    @name = attr[:name]
    @id = @@array.empty? ? 0 : @@array.size
    @@array << self
  end

  def self.find(id)
    @@array.select {|fish| fish.id == id}
  end

  def self.method_missing(m, *args, &block)
    @@array.select {|f| f.send(m.to_s.split('find_by_').last) == args.first}
  end
end

class Tuna < Fish
  def initialize(attr = {})
    super(attr)
    @origin = attr[:origin]
  end
end

class Shark < Fish
  def initialize(attr = {})
    super(attr)
    @color = attr[:color]
  end
end
