require 'atelier'

describe Atelier::Environment::Delegatable do

  class DelegatableHash < Hash; extend Atelier::Environment::Delegatable
  end

  class IncludingIt
    include DelegatableHash.to_module
  end

  subject { IncludingIt.new }

  example do
    subject[:x] = 42
    expect(subject[:x]).to eq 42
  end

  example do
    subject[:x] = 42
    expect(subject.keys).to eq [:x]
  end

  context "And importable" do

    ImportableHash = DelegatableHash.to_module
    module ImportableHash; extend Atelier::Environment::Allocatable; extend Atelier::Environment::Importable; end

    subject { ImportableHash.only(:[], :[]=).new }

    example do
      subject[:x] = 42
      expect(subject[:x]).to eq 42
    end

    example do
      subject[:x] = 42
      expect{subject.keys}.to raise_error NoMethodError
    end
  end
end