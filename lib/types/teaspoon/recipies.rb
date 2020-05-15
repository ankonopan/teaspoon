# frozen_string_literal: true

module Types
  module Teaspoon
    # :nodoc:
    class Recipies
      attr_accessor :count, :recipies

      def initialize(response)
        @count = response.count
        @recipies = response.items
      end

      def empty?
        @recipies.empty?
      end

      def self.empty
        new(OpenStruct.new(count: 0, items: []))
      end
    end
  end
end
