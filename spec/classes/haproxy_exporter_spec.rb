require 'spec_helper'

describe 'prometheus::haproxy_exporter' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with version specified' do
        let(:params) do
          {
            version: '0.7.1',
            arch: 'amd64',
            os: 'linux'
          }
        end

        describe 'install correct binary' do
          it { is_expected.to contain_file('/usr/local/bin/haproxy_exporter').with('target' => '/opt/haproxy_exporter-0.7.1.linux-amd64/haproxy_exporter') }
        end
      end
    end
  end
end
