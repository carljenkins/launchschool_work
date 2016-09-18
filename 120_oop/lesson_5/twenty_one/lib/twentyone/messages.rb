#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require 'YAML'
module TwentyOne
  module Messages
    LANGUAGE = 'en'.freeze
    MESSAGES = YAML.load_file('../lib/twentyone/twentyone_messages.yml')

    def messages(message, lang = 'en')
      puts MESSAGES[lang][message]
    end

    def dealer_label(key, lang = 'en')
      MESSAGES[lang][key]
    end

    def player_label(key, lang = 'en')
      MESSAGES[lang][key]
    end

    def hands_label(key, lang = 'en')
      MESSAGES[lang][key]
    end
  end
end
