# frozen_string_literal: true
#
# ronin-exfil - A Ruby CLI utility for receiving exfiltrated data.
#
# Copyright (c) 2023 Hal Brodigan (postmodern.mod3@gmail.com)
#
# ronin-exfil is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-exfil is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-exfil.  If not, see <https://www.gnu.org/licenses/>.
#

require 'ronin/exfil/cli/command'
require 'ronin/exfil/http'

require 'ronin/core/cli/logging'

module Ronin
  module Exfil
    class CLI
      module Commands
        #
        # Starts a HTTP server for receiving exfiltrated data.
        #
        # ## Usage
        #
        #     ronin-exfil http [options]
        #
        # ## Options
        #
        #     -H, --host IP                    The interface to listen on (Default: 0.0.0.0)
        #     -p, --port PORT                  The port to listen on (Default: 8080)
        #         --vhost HOST                 The Host: header to filter requests by
        #     -R, --root DIR                   The root directory to filter requests by (Default: /)
        #     -h, --help                       Print help information
        #
        class Http < Command

          include Core::CLI::Logging

          usage '[options]'

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

          man_page 'ronin-exfil-http.1'

          #
          # Runs the `ronin-exfil http` command.
          #
          def run
            Ronin::Exfil::HTTP.listen(**proxy_kwargs) do |request|
              remote_addr = request.remote_address

              log_info "Received HTTP request from #{remote_addr.ip_address}:#{remote_addr.ip_port} ..."

              puts "#{request.method} #{request.path}"

              request.headers.each do |name,value|
                puts "#{name}: #{value}"
              end

              puts request.body if request.body
              puts
            end
          end

          #
          # Maps options to keyword arguments for `Ronin::Exfil::HTTP.listen`.
          #
          # @return [Hash{Symbol => Object}]
          #
          def proxy_kwargs
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
