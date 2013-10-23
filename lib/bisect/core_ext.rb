require 'bisect'
class Array
  # Copy all methods from Bisect onto all arrays.
  Bisect.methods(false).each do |method|
    define_method(method) do |*args, &blk|
      Bisect.send(method, self, *args, &blk)
    end
  end
end
