#!/usr/bin/env ruby

require 'dotenv'
require 'openai'

# Load environment variables from .env file
Dotenv.load

module ChatGPT
  @@client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_API_KEY'))

  def self.get_gpt_response(prompt)
    print "ChatGPT: "
    @@client.chat(
      parameters: {
        model: 'gpt-3.5-turbo', # Required.
        messages: [{ role: 'user', content: prompt }], # Required.
        temperature: 0.7,
        stream: proc do |chunk, _bytesize|
          print chunk.dig('choices', 0, 'delta', 'content')
        end
      }
    )
    puts "\n"
  end

  def self.start_chat
    puts "Welcome to ChatGPT CLI!\nType ':exit' to quit."

    loop do
      print 'You: '
      user_input = gets.chomp

      break if user_input.downcase == ':exit'

      get_gpt_response(user_input)
    end

    puts 'Goodbye! Have a great day.'
  end

  def self.example
    @@client.chat(
      parameters: {
        model: 'gpt-3.5-turbo', # Required.
        messages: [{ role: 'user', content: 'Describe a character called Anna!' }], # Required.
        temperature: 0.7,
        stream: proc do |chunk, _bytesize|
          print chunk.dig('choices', 0, 'delta', 'content')
        end
      }
    )
  end
end

# Run the chat
ChatGPT.start_chat
