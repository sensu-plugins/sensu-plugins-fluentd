#!/usr/bin/env ruby
#
# Sensu Fluentd Handler
# ===
#
# This handler sends Sensu event to Fluentd via HTTP request. You can
# change the handler settings using the fluentd.json configuration file,
# located by default in /etc/sensu/conf.d directory.
#
# Fluentd handler has following options:
#  - host: Fluentd host (default: localhost)
#  - port: Fluentd HTTP port (default: 9880)
#  - tag_prefix: Fluentd event tag prefix (default: sensu)
#
# Copyright 2014 Masahiro Nakagawa <repeatedly@gmail.com>
#
# Released under the same terms as Sensu (the MIT license); see LICENSE
# for details.

require 'sensu-handler'
require 'net/http'
require 'timeout'

#
# Sensu Handler class for Fluentd
#
class Fluentd < Sensu::Handler
  # set the fluentd host
  #
  def host
    settings['fluentd']['host'] || 'localhost'
  end

  # set the fluentd port number
  #
  def port
    settings['fluentd']['port'] || 9880
  end

  # set the tag prefix
  #
  def tag_prefix
    settings['fluentd']['tag_prefix'] || 'sensu'
  end

  # create the event tag
  #
  def event_tag
    tag_prefix + '.' + action_to_string.downcase
  end

  # create the event name
  #
  def event_name
    @event['client']['name'] + '/' + @event['check']['name']
  end

  # check the event action
  #
  def action_to_string
    @event['action'].eql?('resolve') ? 'RESOLVED' : 'ALERT'
  end

  # main function
  #
  def handle
    event = {
      action: action_to_string,
      name: event_name,
      client: @event['client']['name'],
      check_name: @event['check']['name'],
      status: @event['check']['status'],
      output: @event['check']['output'],
      address: @event['client']['address'],
      command: @event['check']['command'],
      occurrences: @event['occurrences'],
      flapping: @event['check']['flapping']
    }

    begin
      timeout(5) do
        uri = URI("http://#{host}:#{port}/#{event_tag}?time=#{@event['check']['issued']}")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.path, 'content-type' => 'application/json; charset=utf-8')
        request.body = JSON.dump(event)

        response = http.request(request)
        if response.code == '200'
          puts "fluentd -- #{@event['action']} incident -- #{incident_key}"
        else
          puts "fluentd -- failed to send #{@event['action']} incident -- #{incident_key}"
          puts "fluentd -- response: #{response.inspect}"
        end
      end
    rescue Timeout::Error
      puts "fluentd -- Timed out while attempting to send #{@event['action']} incident -- #{incident_key}"
    end
  end
end
