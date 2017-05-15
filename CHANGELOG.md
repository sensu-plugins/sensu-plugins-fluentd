#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
### Fixed
- handler-fluentd.rb: Fix undefined local variable `incident_key` (@jkernech)

### Changed
- Update `timeout` method to remove deprecation warnings (@eheydrick)

## [0.1.0] - 2015-12-03
### Added
- Added timeout option to check-fluentd-monitor-agent.rb

### Fixed
- Fix uninitialized constant Timeout error

### Changed
- Updated to rubocop 0.32.1

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-02
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-04-29
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-fluentd/compare/0.1.0...HEAD
[0.1.0]: https://github.com/sensu-plugins/sensu-plugins-fluentd/compare/0.0.3...0.1.0
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-fluentd/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-fluentd/compare/0.0.1...0.0.2
