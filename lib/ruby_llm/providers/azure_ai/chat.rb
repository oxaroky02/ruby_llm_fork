# frozen_string_literal: true

module RubyLLM
  module Providers
    module AzureAI
      # Chat methods of the Azure OpenAI API integration
      module Chat
        extend OpenAI::Chat

        module_function

        def sync_response(connection, payload)
          # Hold config in instance variable for use in completion_url and stream_url
          @config = connection.config
          super
        end

        def completion_url
          # https://<ENDPOINT>/models/chat/completions?api-version=<APIVERSION>
          "chat/completions?api-version=#{@config.azure_ai_api_version}"
        end
      end
    end
  end
end
