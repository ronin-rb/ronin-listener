# frozen_string_literal: true
#
# ronin-listener - A Ruby CLI utility for receiving exfiltrated data.
#
# Copyright (c) 2023 Hal Brodigan (postmodern.mod3@gmail.com)
#
# ronin-listener is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-listener is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-listener.  If not, see <https://www.gnu.org/licenses/>.
#

require 'ronin/listener/cli/command'
require 'ronin/listener/output_formats'
require 'ronin/listener/dns'

require 'ronin/core/cli/logging'

module Ronin
  module Listener
    class CLI
      module Commands
        #
        # Starts a DNS server for receiving exfiltrated data.
        #
        # ## Usage
        #
        #     ronin-listener dns [options] DOMAIN
        #
        # ## Options
        #
        #     -o, --output FILE                The output file to write DNS queries to
        #     -F, --output-format txt|csv|json|ndjson
        #                                      The output format
        #     -H, --host IP                    The interface to listen on (Default: 0.0.0.0)
        #     -p, --port PORT                  The port to listen on (Default: 53)
        #     -h, --help                       Print help information
        #
        # ## Arguments
        #
        #     DOMAIN                           The domain to receive queries for
        #
        # ## Examples
        #
        #     ronin-listener dns -H 127.0.0.1 -p 5553 example.com
        #
        class Dns < Command

          include Core::CLI::Logging

          usage '[options] DOMAIN'

          option :output, short: '-o',
                          value: {
                            type:  String,
                            usage: 'FILE'
                          },
                          desc: 'The output file to write DNS queries to' do |path|
                            options[:output]          = path
                            options[:output_format] ||= OutputFormats.infer_from(path)
                          end

          option :output_format, short: '-F',
                                 value: {
                                   type: OutputFormats.formats
                                 },
                                 desc: 'The output format'

          option :host, short: '-H',
                        value: {
                          type:    String,
                          usage:   'IP',
                          default: '0.0.0.0'
                        },
                        desc: 'The interface to listen on'

          option :port, short: '-p',
                        value: {
                          type:    Integer,
                          usage:   'PORT',
                          default: 53
                        },
                        desc: 'The port to listen on'

          argument :domain, required: true,
                            desc:     'The domain to receive queries for'

          description 'Starts a DNS server for receiving exfiltrated data'

          examples [
            '-H 127.0.0.1 -p 5553 example.com'
          ]

          man_page 'ronin-listener-dns.1'

          #
          # Runs the `ronin-listener dns` command.
          #
          # @param [String] domain
          #   The `DOMAIN` argument.
          #
          def run(domain)
            output_file = if options[:output] && options[:output_format]
                            options[:output_format].open(options[:output])
                          end

            Ronin::Listener::DNS.listen(domain,**proxy_kwargs) do |query|
              log_info "Received DNS query: #{query.type} #{query.label} from #{query.source}"
              output_file << query if output_file
            end
          end

          #
          # Maps options to keyword arguments for `Ronin::Listener::DNS.listen`.
          #
          # @return [Hash{Symbol => Object}]
          #
          def proxy_kwargs
            {
              host: options[:host],
              port: options[:port]
            }
          end

        end
      end
    end
  end
end
