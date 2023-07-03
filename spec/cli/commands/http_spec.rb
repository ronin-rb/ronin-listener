require 'spec_helper'
require 'ronin/listener/cli/commands/http'
require_relative 'man_page_example'

describe Ronin::Listener::CLI::Commands::Http do
  include_examples "man_page"
end
