DROP USER if exists 'user'@'%';

CREATE USER 'user'@'%' IDENTIFIED BY 'user';
REVOKE ALL privileges ON *.* FROM 'user'@'%';
GRANT SELECT ON legislature_repubblica.* TO 'user'@'%'; 
ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'user';
FLUSH PRIVILEGES;


