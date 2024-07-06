require 'spec_helper'
require 'ronin/listener/cli/commands/http'
require_relative 'man_page_example'

describe Ronin::Listener::CLI::Commands::Http do
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

      it "must default options[:port] to 8080" do
        expect(subject.options[:port]).to eq(8080)
      end

      it "must default options[:root] to '/'" do
        expect(subject.options[:root]).to eq('/')
      end
    end
  end

  describe "#server_kwargs" do
    let(:host)  { '127.0.0.1' }
    let(:port)  { 9000 }
    let(:vhost) { 'example.com' }
    let(:root)  { '/root/' }
    let(:argv) do
      [
        '--host', host,
        '--port', port.to_s,
        '--vhost', vhost,
        '--root', root
      ]
    end

    before { subject.option_parser.parse(argv) }

    it "must return a Hash including '--host', '--port', '--vhost', and '--root' option values" do
      expect(subject.server_kwargs).to eq(
        {
          host:  host,
          port:  port,
          vhost: vhost,
          root:  root
        }
      )
    end
  end

  describe "#print_request" do
    let(:remote_ip)     { '192.168.1.1' }
    let(:remote_port)   { 1234 }
    let(:remote_addr)   { Addrinfo.tcp(remote_ip,remote_port) }
    let(:method)        { 'GET' }
    let(:path)          { '/' }
    let(:version)       { '1.1' }
    let(:header_name1)  { 'Host' }
    let(:header_value1) { 'host1.com' }
    let(:headers)       { {header_name1 => header_value1} }
    let(:body)          { "foo bar" }
    let(:request) do
      Ronin::Listener::HTTP::Request.new(
        remote_addr: remote_addr,
        method:      method,
        path:        path,
        version:     version,
        headers:     headers,
        body:        body
      )
    end

    it "must print the request method, request path, headers, and body" do
      expect {
        subject.print_request(request)
      }.to output(
        [
          "#{method} #{path}",
          "#{header_name1}: #{header_value1}",
          "",
          "#{body}",
          "",
          ""
        ].join($/)
      ).to_stdout
    end

    context "when the request has no body" do
      let(:body) { nil }

      it "must omit the body from the output" do
        expect {
          subject.print_request(request)
        }.to output(
          [
            "#{method} #{path}",
            "#{header_name1}: #{header_value1}",
            "",
            ""
          ].join($/)
        ).to_stdout
      end
    end
  end
end
