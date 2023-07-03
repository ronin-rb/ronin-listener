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
require 'ronin/core/cli/generator'
require 'ronin/listener/root'

module Ronin
  module Listener
    class CLI
      module Commands
        class New < Command
          #
          # Creates a new standalone DNS listener Ruby script.
          #
          # ## Usage
          #
          #     ronin-listener new dns PATH
          #
          # ## Options
          #
          #     -H, --host IP                    The interface to listen on (Default: 0.0.0.0)
          #     -p, --port PORT                  The port to listen on (Default: 5553)
          #         --domain DOMAIN              The domain to receive queries for (Default: example.com)
          #     -h, --help                       Print help information
          #
          # ## Arguments
          #
          #     PATH                             The script file to create
          #
          class Dns < Command

            include Core::CLI::Generator

            template_dir File.join(ROOT,'data','new')

            usage '[options] PATH'

            option :host, short: '-H',
                          value: {
                            type:    String,
                            usage:   'IP',
                            default: '0.0.0.0'
                          },
                          desc: 'The interface to listen on' do |host|
                            @host = host
                          end

            option :port, short: '-p',
                          value: {
                            type:    Integer,
                            usage:   'PORT',
                            default: 5553
                          },
                          desc: 'The port to listen on' do |port|
                            @port = port
                          end

            option :domain, short: '-d',
                            value: {
                              type:    String,
                              usage:   'DOMAIN',
                              default: 'example.com'
                            },
                            desc: 'The domain to receive queries for' do |domain|
                              @domain = domain
                            end

            argument :path, required: true,
                            desc:     'The script file to create'

            description 'Creates a new standalone DNS listener Ruby script'

            man_page 'ronin-listener-new-dns.1'

            #
            # Initializes the `ronin-listener new dns` command.
            #
            # @param [Hash{Symbol => Object}] kwargs
            #   Additional keyword arguments for the command.
            #
            def initialize(**kwargs)
              super(**kwargs)

              @host   = '0.0.0.0'
              @port   = 5553
              @domain = 'example.com'
            end

            #
            # Runs the `ronin-listener new dns` command.
            #
            # @param [String] path
            #   The path to the new script file to create.
            #
            def run(path)
              erb 'dns.rb.erb', path
              chmod '+x', path
            end

          end
        end
      end
    end
  end
end
