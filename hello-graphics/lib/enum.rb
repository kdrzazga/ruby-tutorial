class Enum
  def self.define(*values)
    @values = values
    values.each do |value|
      const_set(value.upcase, value)
    end
  end

  def self.values
    @values
  end
end

class Direction < Enum
  define :LEFT, :RIGHT
end

class LemmingClass < Enum
  define :WALKER, :BLOCKER, :JUMPER, :BUILDER, :FLOATER
end
