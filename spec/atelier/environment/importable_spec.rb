require 'atelier'

describe Atelier::Environment::Importable do

  module Functions; extend Atelier::Environment::Importable

    def x
      :x
    end

    def y
      :y
    end

    def self.new; m = self
      Class.new {
        include m
      }.new
    end
  end

  context "only(:x)" do

    subject { Functions.only(:x).new }

    its(:x) { should == :x }
    it { expect { subject.y }.to raise_error NoMethodError }
  end

  context "hiding(:x)" do

    subject { Functions.hiding(:x).new }

    it { expect { subject.x }.to raise_error NoMethodError }
    its(:y) { should == :y }
  end

  context "[:x => :z]" do

    subject { Functions[:x => :z].new }

    it { expect { subject.x }.to raise_error NoMethodError }
    its(:y) { should == :y }
    its(:z) { should == :x }
  end

  context "[:x => :z].only(:z)" do

    subject { Functions[:x => :z].only(:z).new }

    it { expect { subject.x }.to raise_error NoMethodError }
    it { expect { subject.y }.to raise_error NoMethodError }
    its(:z) { should == :x }
  end

  context "[:x => :z].hiding(:z)" do

    subject { Functions[:x => :z].hiding(:z).new }

    it { expect { subject.x }.to raise_error NoMethodError }
    its(:y) { should == :y }
    it { expect { subject.z }.to raise_error NoMethodError }
  end
end