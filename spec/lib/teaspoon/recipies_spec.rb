# frozen_string_literal: true

describe Teaspoon::Recipies do
  let(:client) do
    Contentful::Client.new(
      space: ENV['MS_SPACE_ID'],
      access_token: ENV['MS_ACCESS_TOKE'],
      api_url: 'cdn.contentful.com',
      entry_mapping: {
        'recipe' => Types::Teaspoon::Recipe
      }
    )
  end
  let(:first_recipe_id) do
    config[:client].entries(content_type: 'recipe').first.id
  end
  subject { described_class.new(client: client) }

  it 'list all availabla recipies' do
    subject.all.tap do |response|
      expect(response).to be_a(Types::Teaspoon::Recipies)
      expect(response.count).to eq(4)
      expect(response.recipies.first).to be_a(Types::Teaspoon::Recipe)
    end
  end

  it 'shows a single recipe' do
    subject.show(first_recipe_id).tap do |response|
      expect(response).to be_a(Types::Teaspoon::Recipe)
      expect(response.id).to eq(first_recipe_id)
    end
  end
end
