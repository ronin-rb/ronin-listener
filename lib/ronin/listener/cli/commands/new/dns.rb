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
          # ## Arguments
          #
          #     PATH                             The script file to create
          #
          class Dns < Command

            include Core::CLI::Generator

            template_dir File.join(ROOT,'data','new')

            usage 'PATH'

            argument :path, required: true,
                            desc:     'The script file to create'

            description 'Creates a new standalone DNS listener Ruby script'

            man_page 'ronin-listener-new-dns.1'

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
