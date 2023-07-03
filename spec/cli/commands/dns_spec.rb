require 'spec_helper'
require 'ronin/listener/cli/commands/dns'
require_relative 'man_page_example'

describe Ronin::Listener::CLI::Commands::Dns do
  include_examples "man_page"
end
