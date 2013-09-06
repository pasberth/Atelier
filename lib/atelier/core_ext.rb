require 'atelier/environment/importable'
require 'atelier/environment/allocatable'
require 'atelier/environment/delegatable'
require 'atelier/environment/symbol'

class Symbol; include Atelier::Environment::Symbol; end
class Module; include Atelier::Environment::Allocatable; include Atelier::Environment::Importable; end
class Class; include Atelier::Environment::Delegatable; end