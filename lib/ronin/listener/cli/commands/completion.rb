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

require 'ronin/listener/root'
require 'ronin/core/cli/completion_command'

module Ronin
  module Listener
    class CLI
      module Commands
        #
        # Manages the shell completion rules for `ronin-listener`.
        #
        # ## Usage
        #
        #     ronin-listener completion [options]
        #
        # ## Options
        #
        #         --print                      Prints the shell completion file
        #         --install                    Installs the shell completion file
        #         --uninstall                  Uninstalls the shell completion file
        #     -h, --help                       Print help information
        #
        # ## Examples
        #
        #     ronin-listener completion --print
        #     ronin-listener completion --install
        #     ronin-listener completion --uninstall
        #
        class Completion < Core::CLI::CompletionCommand

          completion_file File.join(ROOT,'data','completions','ronin-listener')

          man_dir File.join(ROOT,'man')
          man_page 'ronin-listener-completion.1'

          description 'Manages the shell completion rules for ronin-listener'

        end
      end
    end
  end
end
