# frozen_string_literal: true

require 'contentful'

lib = File.dirname(__FILE__)
Dir.glob(File.join(lib, 'types', '**', '*.rb'), &method(:require))
Dir.glob(File.join(lib, 'teaspoon', '**', '*.rb'), &method(:require))

# :nodoc:
module Teaspoon
end
