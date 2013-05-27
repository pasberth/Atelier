module Atelier; module Test; module Contract

class Notary

  attr_accessor :enable

  def unitest
    yield if @enable
  end
end; end; end; end
