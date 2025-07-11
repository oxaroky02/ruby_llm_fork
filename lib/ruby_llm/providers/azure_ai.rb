# frozen_string_literal: true

module RubyLLM
  module Providers
    # Azure OpenAI API integration. Derived from OpenAI integration to support
    # OpenAI capabilities via Microsoft Azure endpoints.
    module AzureAI
      extend OpenAI
      extend AzureAI::Chat
      extend AzureAI::Streaming

      module_function

      def api_base(config)
        # https://<ENDPOINT>/models/chat/completions?api-version=<APIVERSION>
        "#{config.azure_ai_api_base}/models"
      end

      def headers(config)
        {
          'Authorization' => "Bearer #{config.azure_ai_api_key}"
        }.compact
      end

      def capabilities
        OpenAI::Capabilities
      end

      def slug
        'azure_ai'
      end

      def configuration_requirements
        %i[azure_ai_api_key azure_ai_api_base azure_ai_api_version]
      end

      def local?
        false
      end
    end
  end
end
