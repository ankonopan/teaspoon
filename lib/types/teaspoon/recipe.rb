# frozen_string_literal: true

module Types
  module Teaspoon
    # :nodoc:
    class Recipe < Contentful::Entry
      def to_h
        data = {
          title: title,
          calories: calories,
          description: description
        }

        data[:photo] = photo.url if respond_to?(:photo)

        data[:tags] = tags.map(&:name) if respond_to?(:tags)

        data
      end
    end
  end
end
