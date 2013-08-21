require 'atelier/environment/symbol'
require 'atelier/environment/allocatable'

class Symbol; include Atelier::Environment::Symbol; end
class Module; include Atelier::Environment::Allocatable; include Atelier::Environment::Importable; end
class Class; include Atelier::Environment::Delegatable; end