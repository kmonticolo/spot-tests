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

