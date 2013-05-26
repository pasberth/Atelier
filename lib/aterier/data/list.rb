require 'aterier/control/monad'

module Aterier

  module Data

    module List; include Control::Monad::Monad

      extend self

      def unit(a)
        [a]
      end

      def bind(m, &k)
        m.flat_map(&k)
      end
    end
  end
end