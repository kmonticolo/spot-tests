require 'serverspec'
require 'winrm'

set :backend, :winrm

username = "administrator"
password = "Cdci2018"
endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"

opts = {
  user: username,
  password: password,
  endpoint: endpoint,
  operation_timeout: 300,
}

winrm = WinRM::Connection.new ( opts)
Specinfra.configuration.winrm = winrm
