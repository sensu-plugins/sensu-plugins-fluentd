## Sensu-Plugins-fluentd

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-fluentd.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-fluentd)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-fluentd.svg)](http://badge.fury.io/rb/sensu-plugins-fluentd)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-fluentd.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-fluentd)
[ ![Codeship Status for sensu-plugins/sensu-plugins-fluentd](https://codeship.com/projects/fe235610-d22f-0132-a14d-4afb0344239b/status?branch=master)](https://codeship.com/projects/77468)

## Functionality

**check-fluentd-monitor-agent**

Check a user supplied metric against a remote fluentd monitor

**handler-fluentd**

Fluentd Sensu handler

## Files
 * bin/check-fluentd-monitor-agent.rb
 * bin/metric-fluentd-monitor-agent.rb
 * bin/handler-fluentd.rb

## Usage

**fluentd** example handler configuration
```json
{
  "fluentd": {
    "host": "localhost",
    "port": 9880,
    "tag_prefix": "sensu"
  }
}
```

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
