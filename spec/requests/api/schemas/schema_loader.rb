require 'json'

module SpecSchemas
  class SpecLoader

    def initialize(filename)
      @filename = filename
    end

    def load
      JSON.parse(File.read(@filename))
    end

  end
end
