require 'spec_helper'

describe PushWoosher::Device::Ios do
  its(:device_type) { should eq 1 }
end
