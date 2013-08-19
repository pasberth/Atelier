module Atelier; module Environment

  module Symbol

    def +@
      { self => true }
    end

    def -@
      { self => false }
    end
  end; end; end
