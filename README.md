The bisect gem provides helpers for dealing with sorted Arrays.

Installation
============

```
gem install bisect
```

If you're using Bundler, add `gem 'bisect'` to your Gemfile.

Usage
=====

There are two functions that you need to know about `Bisect.insort` and `Bisect.bisect`.

`Bisect.insort` adds a new element to the Array, but keeps the Array sorted:

```ruby
require 'bisect'
a = [1, 2, 4]
Bisect.insort(a, 3)
a == [1, 2, 3, 4]
```

`Bisect.bisect` gives you the index at which the element would have been inserted:

```ruby
require 'bisect'
a = ['a', 'b', 'd']
Bisect.bisect(a, 'c') == 2
```

If there are equal elements in the Array then `insort` will insert the element after the last equal element. Similarly `bisect` will return the index one higher than the last equal element. If you'd like to add new elements before equal elements, use `insort_left` and `bisect_left`. If you need to be explicit then `insort_right` and `bisect_right` are aliases for `insort` and `bisect`.

Core ext
========
If you want these methods in your Arrays by default, `require 'bisect/core_ext'` If you're using bundler, add `gem 'bisect', :require => 'bisect/core_ext'` to your Gemfile.

```ruby
require 'bisect/core_ext'
a = [1, 2, 4]
a.insort(3)
a == [1, 2, 3, 4]
```

Why?
====

The problem of maintaining a sorted array keeps cropping up, and I like the Python API. As this kind of code has lots of edge-cases, I'm glad the Pythonistas have debugged it already.

Future work
===========

* Add a subclass of Array that magically stays sorted.

Meta-fu
=======

Licensed under the MIT license, bug reports and pull requests welcome.
