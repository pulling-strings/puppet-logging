require 'spec_helper'
describe 'logging' do

  context 'with defaults for all parameters' do
    it { should contain_class('logging') }
  end
end
