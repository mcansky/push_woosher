require 'spec_helper'

describe PushWoosher::Device::Android do
  its(:device_type) { should eq 3 }
end
