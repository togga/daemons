require 'spec_helper'

describe Daemons::PidFile do
  describe "#find_files" do
    it 'does not include files with shared prefix' do
      Dir.stub('[]') { %w{srv.pid srv123.pid srv-other.pid} }
      File.stub(:readable?) { true }
      File.stub(:file?) { true }
      expect(Daemons::PidFile.find_files('/', 'srv')).to eql %w{srv.pid srv123.pid}
    end
  end
end
