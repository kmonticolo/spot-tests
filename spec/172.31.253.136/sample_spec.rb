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

describe 'SQL Server 2016' do
describe service('SQL Server (MSSQLSERVER)') do
it { should be_installed }
it { should be_enabled }
it { should be_running }
it { should have_start_mode('Automatic') }
end

describe package('Microsoft SQL Server 2016 (64-bit)') do
it { should be_installed }
end

describe port(1433) do
	it { should be_listening.with('tcp') }
end
end

describe package('Microsoft SQL Server Management Studio - 17.4') do
it { should be_installed } 
end

describe service('SeaChange Setup') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Automatic") }
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

describe service('SeaChange Infusion Spot+ Service') do
  it { should be_installed }
  it { should be_enabled }
  #it { should be_running }
  it { should have_start_mode("Automatic") }
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

describe user('LocalScsetup') do
  it { should exist }
  it { should belong_to_group('Administrators')}
  it { should belong_to_group('Spot Services')}
end

describe user('LocalSpotServices') do
  it { should exist }
  it { should belong_to_group('Administrators')}
  it { should belong_to_group('Spot Services')}
end

describe user('LocalViewOnlyUser') do
  it { should exist }
  it { should belong_to_group('Administrators')}
  it { should belong_to_group('Spot View Only')}
end

describe user('Administrator') do
  it { should exist }
  it { should belong_to_group('Administrators')}
  it { should belong_to_group('Spot Administrators')}
end

#describe command('& "C:\Program Files (x86)\NTP\bin\ntpq -pn"') do
  #its(:stdout) { should match /.*192\.168\.160\.158.*/ }
#end

describe file('C:\Program Files (x86)\NTP\etc\ntp.conf') do
  it { should be_file }
  it { should contain "server 192.168.160.158" }
end
