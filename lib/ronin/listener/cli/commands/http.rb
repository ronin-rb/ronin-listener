# frozen_string_literal: true
#
# ronin-listener - A Ruby CLI utility for receiving exfiltrated data.
#
# Copyright (c) 2023-2024 Hal Brodigan (postmodern.mod3@gmail.com)
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
require 'ronin/listener/http'

require 'ronin/core/cli/logging'

module Ronin
  module Listener
    class CLI
      module Commands
        #
        # Starts a HTTP server for receiving exfiltrated data.
        #
        # ## Usage
        #
        #     ronin-listener http [options]
        #
        # ## Options
        #
        #     -o, --output FILE                The output file to write HTTP requests to
        #     -F, --output-format txt|csv|json|ndjson
        #                                      The output format
        #     -H, --host IP                    The interface to listen on (Default: 0.0.0.0)
        #     -p, --port PORT                  The port to listen on (Default: 8080)
        #         --vhost HOST                 The Host: header to filter requests by
        #     -R, --root DIR                   The root directory to filter requests by (Default: /)
        #     -h, --help                       Print help information
        #
        # ## Examples
        #
        #     ronin-listener http -H 127.0.0.1 -p 8080
        #     ronin-listener http -H 127.0.0.1 -p 8080 --vhost example.com
        #
        class Http < Command

          include Core::CLI::Logging

          usage '[options]'

          option :output, short: '-o',
                          value: {
                            type:  String,
                            usage: 'FILE'
                          },
                          desc: 'The output file to write HTTP requests to' do |path|
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
                          default: 8080
                        },
                        desc: 'The port to listen on'

          option :vhost, value: {
                           type:  String,
                           usage: 'HOST'
                         },
                         desc: 'The Host: header to filter requests by'

          option :root, short: '-R',
                        value: {
                          type:    String,
                          usage:   'DIR',
                          default: '/'
                        },
                        desc: 'The root directory to filter requests by'

          description 'Starts a HTTP server for receiving exfiltrated data'

          examples [
            '-H 127.0.0.1 -p 8080',
            '-H 127.0.0.1 -p 8080 --vhost example.com'
          ]

          man_page 'ronin-listener-http.1'

          #
          # Runs the `ronin-listener http` command.
          #
          def run
            output_file = if options[:output]
                            options[:output_format].open(options[:output])
                          end

            log_info "Listening on #{options[:host]}:#{options[:port]} ..."

            Ronin::Listener::HTTP.listen(**server_kwargs) do |request|
              log_info "Received HTTP request from #{request.remote_ip}:#{request.remote_port} ..."

              puts(request)

              output_file << request if output_file
            end
          end

          #
          # Maps options to keyword arguments for
          # `Ronin::Listener::HTTP.listen`.
          #
          # @return [Hash{Symbol => Object}]
          #
          def server_kwargs
            {
              host:  options[:host],
              port:  options[:port],
              vhost: options[:vhost],
              root:  options[:root]
            }
          end

        end
      end
    end
  end
end
