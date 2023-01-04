***A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.***

Similar to the last level, let's navigate to the specified directory and investigate:

**`bandit22@bandit:~$ cd /etc/cron.d`**  
**`bandit22@bandit:/etc/cron.d$ ls`**  
*`cronjob_bandit15_root  cronjob_bandit17_root  cronjob_bandit22  cronjob_bandit23  cronjob_bandit24  cronjob_bandit25_root  e2scrub_all  otw-tmp-dir  sysstat`*  
**`bandit22@bandit:/etc/cron.d$ cat cronjob_bandit23`**  
*`@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null`*  
*`* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null`*  
**`bandit22@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit23.sh`**  
```
#!/bin/bash 

myname=$(whoami) 
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1) 

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
```

This shell script does the following:
1. It sets the "myname" variable to the current user
2. The "mytarget" variable becomes a modified/truncated MD5 checksum value, using the $myname variable as a seed variable. 
3. It then copies the contents of the password file for the user referenced within $myname, and then outputs to a file within /tmp/, with the filename being the generated MD5 checksum

If we look closely at the cronjob, the job is set to execute the shell script AS bandit23. Therefore, if we can trigger the shell script, and generate the MD5 for ourselves by manipulating the variable, we should be able to derive the filename for the generated target file containing the password for bandit23. 

**`bandit22@bandit:/etc/cron.d$ cp cronjob_bandit23 /tmp/rajh`**  
**`bandit22@bandit:/etc/cron.d$ cd /tmp/rajh`**  
**`bandit22@bandit:/tmp/rajh$ chmod 777 cronjob_bandit23`**  
**`bandit22@bandit:/tmp/rajh$ ./cronjob_bandit23`**  

Now that we've triggered the shell script, let's generate the intended output of the $mytarget variable within the shell script for ourselves. We will do this by replacing the $myname variable in that line of the script with our manipulated input:

**`bandit22@bandit:/tmp/rajh$ echo I am user bandit23 | md5sum | cut -d ' ' -f 1`**  
*`8ca319486bfbbc3663ea0fbe81326349`*  

Since that MD5 checksum string should be the filename within /tmp/ containing the password for bandit23:

**`bandit22@bandit:/tmp/rajh$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349`**  
*`QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G`*
