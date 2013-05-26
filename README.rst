Atelier
========================================

How to try Atelier?
----------------------------------------

.. code:: sh

  $ RUBYLIB=$PWD/lib pry


Examples
----------------------------------------

.. code:: ruby

  require 'aterier'

  Aterier::Data::Maybe.product(1, 2, 3) { |x, y, z| p [x, y, z] }
  # [1, 2, 3]
  Aterier::Data::Maybe.product(1, nil, 3) { |x, y, z| p [x, y, z] }
  # nil

  Aterier::Data::List.product([1,2,3], [4,5,6]) { |x, y| p [x, y] }
  # [1, 4]
  # [1, 5]
  # [1, 6]
  # [2, 4]
  # [2, 5]
  # [2, 6]
  # [3, 4]
  # [3, 5]
  # [3, 6]