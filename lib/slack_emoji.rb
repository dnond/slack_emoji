require 'slack'
require 'diskcached'

class Diskcached
  alias fetch cache
end

class String
  def to_slack_emoji
    ":#{self}:"
  end
end

module SlackEmoji
  class List
    def initialize
      Slack.configure do |config|
        config.token = ENV['SLACK_TOKEN']
      end
    end

    def show
      diskcache.fetch('list') do
        response = Slack.emoji_list
        if response['ok'] == true
          response['emoji'].keys.map(&:to_slack_emoji)
        else
          nil
        end
      end
    end

    private

    def diskcache
      @diskcache ||= Diskcached.new('/tmp/cache/slack_emoji', 86400)
    end
  end
end
