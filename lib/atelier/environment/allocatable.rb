module Atelier; module Environment

  module Allocatable

    def new(*args, &block)
      to_class.new(*args, &block)
    end

    def to_class
      m = self
      Class.new { include m }
    end
  end; end; end