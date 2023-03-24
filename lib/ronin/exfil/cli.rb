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

require 'ronin/exfil/version'

require 'command_kit/commands'
require 'command_kit/commands/auto_load'
require 'command_kit/options/version'

module Ronin
  module Exfil
    #
    # The `ronin-exfil` command-line interface (CLI).
    #
    # @api private
    #
    class CLI

      include CommandKit::Commands
      include CommandKit::Commands::AutoLoad.new(
        dir:       "#{__dir__}/cli/commands",
        namespace: "#{self}::Commands"
      )
      include CommandKit::Options::Version

      command_name 'ronin-exfil'
      version Ronin::Exfil::VERSION

    end
  end
end
