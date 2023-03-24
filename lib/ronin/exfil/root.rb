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

module Ronin
  module Exfil
    # Path to `ronin-exfil` root directory.
    #
    # @api private
    ROOT = File.expand_path(File.join(__dir__,'..','..','..'))
  end
end
