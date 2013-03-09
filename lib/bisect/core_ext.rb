require 'bisect'
class Array
  # Copy all methods from Bisect onto all arrays.
  Bisect.methods(false).each do |method|
    define_method(method) do |*args|
      Bisect.send(method, self, *args)
    end
  end
end
