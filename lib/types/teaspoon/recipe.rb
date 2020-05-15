# frozen_string_literal: true

module Types
  module Teaspoon
    # :nodoc:
    class Recipe < Contentful::Entry
      def tag_names
        respond_to?(:tags) ? tags.map(&:name) : []
      end

      def chef_name
        respond_to?(:chef) ? chef.name : nil
      end
    end
  end
end
