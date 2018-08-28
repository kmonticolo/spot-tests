from winrm.protocol import Protocol

p = Protocol(
    endpoint='http://172.31.253.136:5985/wsman',
    transport='ntlm',
    username=r'administrator',
    password='Cdci2018',
    server_cert_validation='ignore')
shell_id = p.open_shell()
command_id = p.run_command(shell_id, 'ipconfig', ['/all'])
std_out, std_err, status_code = p.get_command_output(shell_id, command_id)
p.cleanup_command(shell_id, command_id)
print(std_out, status_code)
p.close_shell(shell_id)

