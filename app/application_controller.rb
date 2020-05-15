# frozen_string_literal: true

# :nodoc:
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :client, -> {
      Contentful::Client.new(
        space: ENV['MS_SPACE_ID'],
        access_token: ENV['MS_ACCESS_TOKE'],
        api_url: 'cdn.contentful.com',
        entry_mapping: {
          'recipe' => Types::Teaspoon::Recipe
        })
    }
    set :repository, -> { Teaspoon::Recipies.new({ client: client }) }
  end

  get '/' do
    @recipies = settings.repository.all()
    erb :'recipies/index'
  end

  get '/recipies/:id' do
    @recipe = settings.repository.show(params[:id])
    erb :'recipies/show'
  end

end
