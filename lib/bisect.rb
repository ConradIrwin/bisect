# A direct port of the Python bisect standard library.
#
# http://svn.python.org/view/python/branches/py3k/Lib/bisect.py?view=markup&pathrev=70846
#
module Bisect
  # The default comparison function
  # We use a function as it can then be compiled by the JVM or Rubinius JIT
  def self.__b_compare__(x, y)
    x < y
  end
  B_COMPARE = method(:__b_compare__)

  class << self

    # Insert item x in list a, and keep it sorted assuming a is sorted.
    #
    # If x is already in a, insert it to the right of the rightmost x.
    #
    # Optional args lo (default 0) and hi (default len(a)) bound the
    # slice of a to be searched.
    def insort_right(a, x, lo=0, hi=a.size, &compare)
      index = bisect_right(a, x, lo, hi, &compare)
      a.insert(index, x)
    end
    alias_method :insort, :insort_right

    # Return the index where to insert item x in list a, assuming a is sorted.
    #
    # The return value i is such that all e in a[:i] have e <= x, and all e in
    # a[i:] have e > x.  So if x already appears in the list, a.insert(x) will
    # insert just after the rightmost x already there.
    #
    # Optional args lo (default 0) and hi (default len(a)) bound the
    # slice of a to be searched.
    def bisect_right(a, x, lo=0, hi=a.size, &compare)
      raise ArgumentError, "lo must be non-negative" if lo < 0

      compare = B_COMPARE unless compare.respond_to? :call

      while lo < hi
        mid = (lo + hi) / 2
        if compare.call(x, a[mid])
          hi = mid
        else
          lo = mid + 1
        end
      end

      lo
    end
    alias_method :bisect, :bisect_right

    # Insert item x in list a, and keep it sorted assuming a is sorted.
    #
    # If x is already in a, insert it to the left of the leftmost x.
    #
    # Optional args lo (default 0) and hi (default len(a)) bound the
    # slice of a to be searched.
    def insort_left(a, x, lo=0, hi=a.size, &compare)
      index = bisect_left(a, x, lo, hi, &compare)
      a.insert(index, x)
    end

    # Return the index where to insert item x in list a, assuming a is sorted.
    #
    # The return value i is such that all e in a[:i] have e < x, and all e in
    # a[i:] have e >= x.  So if x already appears in the list, a.insert(x) will
    # insert just before the leftmost x already there.
    #
    # Optional args lo (default 0) and hi (default len(a)) bound the
    # slice of a to be searched.
    def bisect_left(a, x, lo=0, hi=a.size, &compare)
      raise ArgumentError, "lo must be non-negative" if lo < 0

      compare = B_COMPARE unless compare.respond_to? :call

      while lo < hi
        mid = (lo + hi) / 2
        if compare.call(a[mid], x)
          lo = mid + 1
        else
          hi = mid
        end
      end

      lo
    end
  end
end
