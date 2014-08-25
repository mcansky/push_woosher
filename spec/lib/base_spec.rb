require 'spec_helper'

describe PushWoosher::Base do
  describe 'constants' do
    it 'should have the base host' do
      expect(PushWoosher::Base::BASE_HOST).to eq 'cp.pushwoosh.com'
    end
    it 'should have the protocol' do
      expect(PushWoosher::Base::PROTOCOL).to eq 'https'
    end
    it 'should have the base host' do
      expect(PushWoosher::Base::BASE_PATH).to eq '/json/1.3'
    end
  end

  describe '#config' do
    let(:configuration) { double(application_code: 'aa', api_token: 'bb') }
    let(:expected_hash) { { application: 'aa', auth: 'bb' } }
    before do
      allow(PushWoosher).to receive(:configuration).and_return(configuration)
    end
    its(:config) { should eq expected_hash }
  end

  describe '#post_action' do
    let(:connection) { double(post: response) }
    before do
      allow(subject).to receive(:connection).and_return(connection)
    end

    context 'success' do
      let(:response) { double(status: 200) }
      its(:post_action) { should eq true }
    end

    context 'failure' do
      let(:response_hash) { { status: 404, message: 'something is wrong' } }
      let(:response) { double(status: 404, body: 'something is wrong') }
      its(:post_action) { should eq response_hash }
    end
  end
end
