Atelier
========================================

How to try Atelier?
----------------------------------------

.. code:: sh

  $ RUBYLIB=$PWD/lib pry


Examples
----------------------------------------

.. code:: ruby

  require 'atelier'

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

**Importable**

.. code:: ruby

  require 'atelier'

  module Functions; extend Atelier::Environment::Importable

    def max(a, b)
      [a, b].max
    end

    def min(a, b)
      [a, b].min
    end
  end

  module A; extend Functions.only(:max)
    p max(1, 2) # => 2
    p min(1, 2) # NoMethodError
  end

  module B; extend Functions.hiding(:max)
    p min(1, 2) # => 1
    p max(1, 2) # NoMethodError
  end

  module C; extend Functions[:max => :f_max]
    p f_max(1, 2) # => 2
    p max(1, 2) # NoMethodError
  end

.. code:: ruby

  require 'atelier'
  require 'json'

  p JSON.parse '{"x":42}', +:symbolize_names
  # => {:x=>42}