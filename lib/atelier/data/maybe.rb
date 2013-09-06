require 'atelier/control/monad'

module Atelier

  module Data

    module MaybeMethods; include Control::Monad::Monad

      def unit(a)
        a
      end

      def bind(m)
        yield m unless m.nil?
      end
    end

    Maybe = MaybeMethods.to_class.to_module
    Maybe.module_eval { extend self }
  end
end