## Sensu-Plugins-fluentd

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-fluentd.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-fluentd)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-fluentd.svg)](http://badge.fury.io/rb/sensu-plugins-fluentd)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-fluentd)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-fluentd.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-fluentd)

## Functionality

**check-fluentd-monitor-agent**

Check a user supplied metric against a remote fluentd monitor

**handler-fluentd**

Fluentd Sensu handler

## Files
 * bin/check-fluentd-monitor-agent
 * bin/handler-fluentd

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

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-fluentd -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-fluentd`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-fluentd' do
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-fluentd' do
  version '0.0.1'
end
```

## Notes
