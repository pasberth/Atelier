require 'atelier'

describe Atelier::Environment::Delegatable do

  ImportableHash = Hash.to_module

  class IncludingIt
    include ImportableHash
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