#!/bin/bash
#Путь для генирируемых правил в файле .htaccess
htaccess_path="/home/youruser/www/your.site/.htaccess"
#Путь для настроек основных правил в файле .htaccess
htaccess_rules="/home/youruser/htaccess"
echo "# Cloudflare IPv4 Rule Start
Order Deny,Allow
Deny from all" > $htaccess_path;
while read ip ; do echo "allow from $ip" >> $htaccess_path; done <<< "$(curl https://www.cloudflare.com/ips-v4)"
echo "# End of the IPv4 Cloudflare Rule" >> $htaccess_path;
echo "# Cloudflare IPv6 Rule Start" >> $htaccess_path;
while read ip ; do echo "allow from $ip" >> $htaccess_path; done <<< "$(curl https://www.cloudflare.com/ips-v6)"
echo "# End of the IPv6 Cloudflare Rule" >> $htaccess_path;
echo "# Other htaccess rules" >> $htaccess_path;
