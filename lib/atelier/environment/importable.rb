module Atelier; module Environment

  module Importable

    def [](aliases); m = self
      Module.new  do; include m; extend Importable
        aliases.each do |x, y|
          alias_method y, x
          undef_method x
        end
      end
    end

    def only(*names)
      hiding *instance_methods + private_instance_methods - names
    end

    def hiding(*names); m = self
      Module.new { include m; names.each {|x| undef_method x }}
    end
  end; end; end