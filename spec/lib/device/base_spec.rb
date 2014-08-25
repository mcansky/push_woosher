require 'spec_helper'

describe PushWoosher::Device::Base do
  let(:token) { SecureRandom.hex }
  let(:hwid) { SecureRandom.hex }
  let(:options) { { token: token, hwid: hwid } }

  subject { described_class.new(options) }

  it { should respond_to(:token) }
  it { should respond_to(:hwid) }
  it { should respond_to(:device_type) }

  context 'requests hashes' do
    let(:device_type) { 1 }

    before { allow(subject).to receive(:device_type).and_return(device_type) }

    describe '#register_request_hash' do
      let(:register_hash) do
        {
          push_token: token,
          hwid: hwid,
          timezone: 0,
          device_type: device_type
        }
      end

      its(:register_request_hash) { should eq register_hash }
    end

    describe '#unregister_request_hash' do
      let(:unregister_hash) { { hwid: hwid } }
      its(:unregister_request_hash) { should eq unregister_hash }
    end
  end
end
