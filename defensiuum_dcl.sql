CREATE USER IF NOT EXISTS 'defensiuum'@'%' IDENTIFIED BY 'defensiuum';

GRANT ALL PRIVILEGES ON db_defensiuum.* TO 'defensiuum'@'%';

FLUSH PRIVILEGES;