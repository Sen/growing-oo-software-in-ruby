def me(text)
#  "#{self.class.name}@#{self.object_id}: #{text}"
  "#{self.class.name}: #{text}"
end

def NullImplementation
  def initialize(*args)
  end

  def method_missing(message, *args)
  end
end
