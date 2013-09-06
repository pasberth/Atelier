require 'atelier/control/monad'

module Atelier

  module Data

    module ListMethods; include Control::Monad::Monad

      def unit(a)
        [a]
      end

      def bind(m, &k)
        m.flat_map(&k)
      end
    end

    List = ListMethods.to_class.to_module
    List.module_eval { extend self }
  end
end