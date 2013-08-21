
module Atelier; module Environment

  module Delegatable

    def to_module
      root = Object

      klass = self
      instance_methods = self.instance_methods
      instance_methods |= self.private_instance_methods
      instance_methods -= root.instance_methods
      instance_methods -= root.private_instance_methods

      Module.new do
        objs = {}

        instance_methods.each do |mth|
          define_method mth do |*args, &block|
            obj = (objs[self] ||= klass.new)
            obj.__send__(mth, *args, &block)
          end; end; end; end
  end; end; end