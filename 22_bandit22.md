***A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.***

There's really not much direction we're given besides a random directory, so let's navigate over there and investigate:

**`bandit21@bandit:~$ cd /etc/cron.d/`**  
**`bandit21@bandit:/etc/cron.d$ ls`**  
*`cronjob_bandit15_root  cronjob_bandit17_root  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  cronjob_bandit25_root  e2scrub_all  otw-tmp-dir  sysstat`*  

As we are solving for the password to bandit22, let's take a look inside the relevant file:

**`bandit21@bandit:/etc/cron.d$ file cronjob_bandit22`**  
*`cronjob_bandit22: ASCII text`*  
**`bandit21@bandit:/etc/cron.d$ cat cronjob_bandit22`**  
*`@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null`*  
*`* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null`*  

The contents of the cronjob file indicates that it executes a shell script within /usr/bin/; let's get some details on that shell script.

**`bandit21@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit22.sh`**  
```
#!/bin/bash
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv 
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```

Ok, so the shell script will change the permissions of some random file within /tmp/, and then output the contents of /etc/bandit_pass/bandit22 to that file. We know that the passwords for each level reside in those correlating files, so getting that script to run is the end goal here. However, if we try to launch the cron job as it stands...

**`bandit21@bandit:/etc/cron.d$ ./cronjob_bandit22`**  
*`-bash: ./cronjob_bandit22: Permission denied`*

Fortunately, we should already know a way around the permissions issues:

**`bandit21@bandit:/etc/cron.d$ cp cronjob_bandit22 /tmp/rajh`**  
**`bandit21@bandit:/etc/cron.d$ cd /tmp/rajh`**  
**`bandit21@bandit:/tmp/rajh$ chmod 777 cronjob_bandit22`**  
**`bandit21@bandit:/tmp/rajh$ ./cronjob_bandit22`**  

Now that the cron job has been successfully executed, let's take a look at the file that was referenced within the shell script:

**`bandit21@bandit:/tmp/rajh$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv`**  
*`WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff`*  
