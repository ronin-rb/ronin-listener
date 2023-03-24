# ronin-exfil

[![CI](https://github.com/ronin-rb/ronin-exfil/actions/workflows/ruby.yml/badge.svg)](https://github.com/ronin-rb/ronin-exfil/actions/workflows/ruby.yml)
[![Code Climate](https://codeclimate.com/github/ronin-rb/ronin-exfil.svg)](https://codeclimate.com/github/ronin-rb/ronin-exfil)

* [Website](https://ronin-rb.dev/)
* [Source](https://github.com/ronin-rb/ronin-exfil)
* [Issues](https://github.com/ronin-rb/ronin-exfil/issues)
* [Documentation](https://ronin-rb.dev/docs/ronin-exfil)
* [Discord](https://discord.gg/6WAb3PsVX9) |
  [Twitter](https://twitter.com/ronin_rb) |
  [Mastodon](https://infosec.exchange/@ronin_rb)

## Description

ronin-exfil is a small CLI utility for receiving exfiltrated data over DNS or
HTTP.

## Features

* Supports starting a DNS server for receiving exfiltrated data via DNS queries
  for a domain.
* Supports starting a HTTP server for receiving exfiltrated data via HTTP
  requests.

## Synopsis

```shell
$ ronin-exfil
Usage: ronin-exfil [options]

Options:
    -V, --version                    Prints the version and exits
    -h, --help                       Print help information

Arguments:
    [COMMAND]                        The command name to run
    [ARGS ...]                       Additional arguments for the command

Commands:
    dns
    help
    http
```

## Requirements

* [Ruby] >= 3.0.0
* [ronin-exfil-dns] ~> 0.1
* [ronin-exfil-http] ~> 0.1
* [ronin-core] ~> 0.1

## Install

```shell
$ gem install ronin-exfil
```

### Gemfile

```ruby
gem 'ronin-exfil', '~> 0.1'
```

### gemspec

```ruby
gem.add_dependency 'ronin-exfil', '~> 0.1'
```

## Development

1. [Fork It!](https://github.com/ronin-rb/ronin-exfil/fork)
2. Clone It!
3. `cd ronin-exfil/`
4. `bundle install`
5. `git checkout -b my_feature`
6. Code It!
7. `bundle exec rake spec`
8. `git push origin my_feature`

## License

Copyright (c) 2023 Hal Brodigan (postmodern.mod3@gmail.com)

ronin-exfil is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-exfil is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with ronin-exfil.  If not, see <https://www.gnu.org/licenses/>.

[Ruby]: https://www.ruby-lang.org
[ronin-exfil-dns]: https://github.com/ronin-rb/ronin-exfil-dns#readme
[ronin-exfil-http]: https://github.com/ronin-rb/ronin-exfil-http#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
