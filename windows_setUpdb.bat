@echo off
setlocal

REM Set MySQL credentials
set MYSQL_DATABASE=grazle
set MYSQL_USER=grazleuser
set MYSQL_PASSWORD=AnotherStr0ngP@ssw0rd!

REM Log in to MySQL and execute commands
(
echo CREATE DATABASE IF NOT EXISTS %MYSQL_DATABASE%;
echo CREATE USER IF NOT EXISTS '%MYSQL_USER%'@'%%' IDENTIFIED BY '%MYSQL_PASSWORD%';
echo GRANT ALL PRIVILEGES ON %MYSQL_DATABASE%.* TO '%MYSQL_USER%'@'%%';
echo FLUSH PRIVILEGES;
) | mysql -u root

echo Database and user setup completed.

endlocal
pause