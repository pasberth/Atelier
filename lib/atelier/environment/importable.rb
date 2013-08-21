module Atelier; module Environment

  module Importable

    def [](aliases)
      self.clone.tap do |m|
        m.module_eval do
          aliases.each do |x, y|
            alias_method y, x
            undef_method x
          end; end; end
    end

    def only(*names)
      hiding *instance_methods + private_instance_methods - names
    end

    def hiding(*names)
      self.clone.tap do |m|
        m.module_eval do
          names.each do |x|
            undef_method x
          end; end; end
    end
  end; end; end