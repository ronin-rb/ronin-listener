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

require 'ronin/core/output_formats'

module Ronin
  module Listener
    #
    # Contains the supported output formats for saving
    # `Ronin::Listener::DNS::Query` and `Ronin::Listener::HTTP::Request`
    # object to output files.
    #
    module OutputFormats
      include Core::OutputFormats

      register :txt,    '.txt',    TXT
      register :csv,    '.csv',    CSV
      register :json,   '.json',   JSON
      register :ndjson, '.ndjson', NDJSON
    end
  end
end
