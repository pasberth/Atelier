require 'atelier/control/monad'

module Atelier

  module Data

    module Maybe; include Control::Monad::Monad

      extend self

      def unit(a)
        a
      end

      def bind(m)
        yield m unless m.nil?
      end
    end
  end
end