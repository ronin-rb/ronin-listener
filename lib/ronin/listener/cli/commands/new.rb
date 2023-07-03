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
require 'command_kit/commands/auto_load'

module Ronin
  module Listener
    class CLI
      module Commands
        #
        # Creates a new DNS or HTTP listener Ruby script.
        #
        # ## Usage
        #
        #     ronin new {project [options] DIR | script FILLE}
        #
        # ## Options
        #
        #     -h, --help                       Print help information
        #
        # ## Arguments
        #
        #
        #     [COMMAND]                        The command name to run
        #     [ARGS ...]                       Additional arguments for the command
        #
        # ## Commands
        #
        #     help
        #     dns
        #     http
        #
        class New < Command

          include CommandKit::Commands::AutoLoad.new(
            dir:       "#{__dir__}/new",
            namespace: "#{self}"
          )

          examples [
            'dns foo.rb',
            'http foo.rb'
          ]

          description 'Creates a new DNS or HTTP listener Ruby script'

          man_page 'ronin-listener-new.1'

        end
      end
    end
  end
end
