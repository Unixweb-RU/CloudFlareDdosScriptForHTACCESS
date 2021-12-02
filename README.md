# CloudFlareDdosScriptForHTACCESS
Простой скрипт с автоматически обновляемыми IP для настройки .htaccess правил для работы с CloudFlare в режиме Ddos защиты

Всем привет!
Работаем в терминале. 
Обязательно устанавливаем пакеты nano, git и curl, повышаем привилегии su или sudo.
Установка для Debian/Ubintu

$ sudo apt install nano git curl

Установка для Centos

$ sudo yum install nano git curl 

Переходим в каталог пользователя - это может быть /home/youruser или /var/www/youruser, youruser имя пользователя

$ cd

Для начала нужжно создать скрипт для запуска, можно сделать так

$ git clone https://github.com/Unixweb-RU/CloudFlareDdosScriptForHTACCESS.git

Переходим в каталог 

$ cd CloudFlareDdosScriptForHTACCESS

Делаем исполняемым наш файл, хотя в нашем случае не обязательно это делать 

$ chmod +x cloudflare-update-htaccess.sh

Создаем задание в cron 

$ EDITOR=nano crontab -e

Добавляем строчки

0 */12 * * * /bin/bash /home/youruser/CloudFlareDdosScriptForHTACCESS/cloudflare-update-htaccess.sh >/dev/null 2>&1

Скрипт выполняется каждые 12 минут.

Скрипт коментирован там все логично, нужно заменить значения переменных на свои.

Путь для  генирируемых правил в файле .htaccess

htaccess_path="/home/youruser/www/your.site/.htaccess"

Путь для настроек основных правил в файле .htaccess

htaccess_rules="/home/youruser/htaccess"
