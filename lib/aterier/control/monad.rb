module Aterier

  module Control

    module Monad

      def product(m, *ms, &k)
        k = ms.reverse_each.inject(k) { |k, m| ->(*xs) { bind(m) {|x| k.call(*xs, x) } } }
        bind(m, &k)
      end
    end
  end
end