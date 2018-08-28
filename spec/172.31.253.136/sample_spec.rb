require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe service('Alarmcol') do
  it { should be_installed }
  #it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe service('Alarmana') do
  it { should be_installed }
  #it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe service('dbm') do
  it { should be_installed }
  #it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe service('pager') do
  it { should be_installed }
  #it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe service('scsetup') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Automatic") }
end

describe service('tb') do
  it { should be_installed }
  #it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end


describe package('Network Time Protocol') do
  it { should be_installed}
end


describe package('Infusion Spot+ Service') do
  it { should be_installed}
end


describe package('Infusion Spot+ Administration') do
  it { should be_installed}
end

describe group('Administrators') do
  it { should exist }
end

describe group('Spot Administrators') do
  it { should exist }
end

describe group('Spot Services') do
  it { should exist }
end

describe group('Spot View Only') do
  it { should exist }
end

