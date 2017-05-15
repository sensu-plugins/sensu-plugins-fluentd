#!/usr/bin/env ruby
#
#   metric-fluentd-monitor
#
# DESCRIPTION:
#   This plugin uses fluentd monitor_agent to monitor buffer, produces
#   Graphite formatted output.
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Copyright 2015 Junpei Tsuji.
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'socket'
require 'net/http'
require 'timeout'
require 'json'

class MetricFluentdMonitorAgent < Sensu::Plugin::Metric::CLI::Graphite
  option :scheme,
         long: '--scheme SCHEME',
         description: 'Metric naming scheme',
         default: "#{Socket.gethostname}.fluentd"
  option :url,
         short: '-u URL',
         long: '--url URL',
         description: 'Fluentd plugins json path',
         default: 'http://localhost:24220/api/plugins.json'
  option :timeout,
         short: '-t SECONDS',
         long: '--timeout SECONDS',
         description: 'Timeout value in seconds',
         default: 5,
         proc: proc(&:to_i)

  def run
    if config[:url]
      uri = URI.parse(config[:url])
      config[:host] = uri.host
      config[:port] = uri.port
      config[:request_uri] = uri.request_uri
    end

    begin
      Timeout.timeout(config[:timeout]) do
        acquire_resource
      end
    rescue Timeout::Error
      critical 'Connection timed out'
    rescue => e
      critical "Connection error: #{e.message}"
    end
  end

  def acquire_resource
    http = Net::HTTP.new(config[:host], config[:port])
    response = http.get(config[:request_uri])
    result = JSON.parse(response.body)
    timestamp = Time.now.to_i

    result['plugins'].each do |r|
      next if r['retry_count'].nil? || r['buffer_total_queued_size'].nil? || r['buffer_queue_length'].nil?
      output [config[:scheme], r['plugin_id'], 'retry_count'].join('.'), r['retry_count'], timestamp
      output [config[:scheme], r['plugin_id'], 'buffer_total_queued_size'].join('.'), r['buffer_total_queued_size'], timestamp
      output [config[:scheme], r['plugin_id'], 'buffer_queue_length'].join('.'), r['buffer_queue_length'], timestamp
    end
    ok
  end
end
