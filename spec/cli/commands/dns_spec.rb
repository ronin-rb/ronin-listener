require 'spec_helper'
require 'ronin/listener/cli/commands/dns'
require_relative 'man_page_example'

describe Ronin::Listener::CLI::Commands::Dns do
  include_examples "man_page"

  describe "options" do
    before { subject.option_parser.parse(argv) }

    describe "when given the '--output FILE' option" do
      let(:argv) { ['--output', file] }

      describe "and the file ends with '.txt'" do
        let(:file) { 'log.txt' }

        it "must set options[:output] to the given file" do
          expect(subject.options[:output]).to eq(file)
        end

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::TXT" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::TXT)
        end
      end

      describe "and the file ends with '.csv'" do
        let(:file) { 'log.csv' }

        it "must set options[:output] to the given file" do
          expect(subject.options[:output]).to eq(file)
        end

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::CSV" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::CSV)
        end
      end

      describe "and the file ends with '.json'" do
        let(:file) { 'log.json' }

        it "must set options[:output] to the given file" do
          expect(subject.options[:output]).to eq(file)
        end

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::JSON" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::JSON)
        end
      end

      describe "and the file ends with '.ndjson'" do
        let(:file) { 'log.ndjson' }

        it "must set options[:output] to the given file" do
          expect(subject.options[:output]).to eq(file)
        end

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::NDJSON" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::NDJSON)
        end
      end

      describe "but the file's extension is not recognized" do
        let(:file) { 'log.foo' }

        it "must set options[:output] to the given file" do
          expect(subject.options[:output]).to eq(file)
        end

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::TXT" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::TXT)
        end
      end
    end

    describe "when given the '--output-format FORMAT' option" do
      let(:argv) { ['--output-format', format] }

      describe "and when FORMAT is 'txt'" do
        let(:format) { 'txt' }

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::TXT" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::TXT)
        end
      end

      describe "and when FORMAT is 'csv'" do
        let(:format) { 'csv' }

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::CSV" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::CSV)
        end
      end

      describe "and when FORMAT is 'json'" do
        let(:format) { 'json' }

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::JSON" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::JSON)
        end
      end

      describe "and when FORMAT is 'ndjson'" do
        let(:format) { 'ndjson' }

        it "must set options[:output_format] to Ronin::Listener::OutputFormats::NDJSON" do
          expect(subject.options[:output_format]).to be(Ronin::Listener::OutputFormats::NDJSON)
        end
      end
    end

    context "when no options are given" do
      let(:argv) { [] }

      it "must default options[:host] to '0.0.0.0'" do
        expect(subject.options[:host]).to eq('0.0.0.0')
      end

      it "must default options[:port] to 53" do
        expect(subject.options[:port]).to eq(53)
      end
    end
  end

  describe "#server_kwargs" do
    let(:host)  { '127.0.0.1' }
    let(:port)  { 5353 }
    let(:argv) do
      [
        '--host', host,
        '--port', port.to_s
      ]
    end

    before { subject.option_parser.parse(argv) }

    it "must return a Hash including '--host' and '--port'" do
      expect(subject.server_kwargs).to eq(
        {
          host:  host,
          port:  port
        }
      )
    end
  end
end
