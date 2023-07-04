require 'spec_helper'
require 'ronin/listener/output_formats'

describe Ronin::Listener::OutputFormats do
  describe "formats" do
    subject { described_class.formats }

    describe ":txt" do
      it "must equal Ronin::Core::OutputFormats::TXT" do
        expect(subject[:txt]).to be(Ronin::Core::OutputFormats::TXT)
      end
    end

    describe ":csv" do
      it "must equal Ronin::Core::OutputFormats::CSV" do
        expect(subject[:csv]).to be(Ronin::Core::OutputFormats::CSV)
      end
    end

    describe ":json" do
      it "must equal Ronin::Core::OutputFormats::JSON" do
        expect(subject[:json]).to be(Ronin::Core::OutputFormats::JSON)
      end
    end

    describe ":ndjson" do
      it "must equal Ronin::Core::OutputFormats::NDJSON" do
        expect(subject[:ndjson]).to be(Ronin::Core::OutputFormats::NDJSON)
      end
    end
  end

  describe "file_exts" do
    subject { described_class.file_exts }

    describe "'.txt'" do
      it "must equal Ronin::Core::OutputFormats::TXT" do
        expect(subject['.txt']).to be(Ronin::Core::OutputFormats::TXT)
      end
    end

    describe "'.csv'" do
      it "must equal Ronin::Core::OutputFormats::CSV" do
        expect(subject['.csv']).to be(Ronin::Core::OutputFormats::CSV)
      end
    end

    describe "'.json'" do
      it "must equal Ronin::Core::OutputFormats::JSON" do
        expect(subject['.json']).to be(Ronin::Core::OutputFormats::JSON)
      end
    end

    describe "'.ndjson'" do
      it "must equal Ronin::Core::OutputFormats::NDJSON" do
        expect(subject['.ndjson']).to be(Ronin::Core::OutputFormats::NDJSON)
      end
    end
  end
end
