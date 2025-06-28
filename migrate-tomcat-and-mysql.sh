#!/bin/bash

#################
# Prep Steps
#################

# INSTALL APPS TO S03
# Install Percona
yum install http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum install percona-xtrabackup.x86_64
yum install percona-toolkit.noarch

# Install Dejavu font
yum install dejavu-sans-fonts.noarch
yum install dejavu-sans-mono-fonts.noarch
yum install dejavu-serif-fonts.noarch

# Install PHP-MySQL
yum install php php-mysql

#################
# File Transfer
#################

# Lsyncd take over this
# Lysnc will be synced pass/cms/ops/mc & backup folder, script folder from s01 to s03. You should be reviewed totally before transfering.
# Install Lsyncd in S03
yum install lsyncd.x86_64

#################
# Prep Environ
#################

# Java & Tomcat environment
echo "export LC_ALL="en_US.UTF-8"\n export JAVA_HOME=/opt/java\n export CATALINA_HOME=/opt/tomcat" >> /etc/bashrc
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin\n export PATH" >> /root/.bash_profile

# Dump and Transfer MySQL Databases files
for f in `mysqldump -Q -q -e -R --add-drop-table -A -uroot -pMoc@579 > /root/database_s01.db`; do scp $f s03:/root/; done
ssh s03 'mysql -uroot -pMoc@579 < /root/database_s01.db'

#################
# Migrate Users and Groups
#################

# copy /etc/passwd account
for f in `awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > /root/passwd.mig`; do scp $f s03:/root/; done
# copy /etc/group
for f in `awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > /root/group.mig`; do scp $f s03:/root/; done
# copy /etc/shadow
for f in `awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > /root/shadow.mig`; do scp $f s03:/root/; done
# copy /etc/gshadow
for f in `cp /etc/gshadow /root/gshadow.mig`; do scp $f s03:/root/; done


#################
# Transfer Jobs
#################

rsync -avz --progress /var/spool/mail/* -e s03:/var/spool/mail/*
rsync -avz --progress /var/spool/cron -e s03:/var/spool/mail/*
rsync -avz --progress /etc/crontab -e s03:/etc/crontab


