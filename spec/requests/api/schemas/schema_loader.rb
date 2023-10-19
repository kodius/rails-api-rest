require 'json'

module SpecSchemas
  class SpecLoader

    def initialize(filename)
      @filename = filename
    end

    def load
      JSON.parse(@filename)
    end

  end
end
