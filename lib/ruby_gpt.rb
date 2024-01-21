require 'openai'
require 'psych'
require 'yaml'

module RubyGpt
  CONFIG_FILE = File.expand_path('~/.ruby_cli_config.yml')
  class << self
    def configure_openai(access_token)
      OpenAI.configure do |config|
        config.access_token = access_token
      end
      save_config(access_token)
    end

    def load_config
      YAML.load_file(CONFIG_FILE) if File.exist?(CONFIG_FILE)
    end

    def save_config(access_token)
      config_data = {'access_token' => access_token}
      File.write(CONFIG_FILE, Psych.dump(config_data))
    end
  end

  config = load_config
  access_token = config['access_token'] if config

  configure_openai(access_token) if access_token
end
