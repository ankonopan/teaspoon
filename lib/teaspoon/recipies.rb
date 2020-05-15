# frozen_string_literal: true

module Teaspoon
  # :nodoc:
  class Recipies
    attr_accessor :client

    def initialize(client:)
      @client = client
    end

    def all
      Types::Teaspoon::Recipies.new client.entries(content_type: 'recipe')
    end

    def show(id)
      client.entry(id)
    end
  end
end
