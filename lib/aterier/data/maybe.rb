require 'aterier/control/monad'

module Aterier

  module Data

    module Maybe; include Control::Monad

      def unit(a)
        a
      end

      def bind(m)
        yield m unless m.nil?
      end
    end
  end
end