***Welcome to Krypton! The first level is easy. The following string encodes the password using Base64:***

***S1JZUFRPTklTR1JFQVQ=***

***Use this password to log in to krypton.labs.overthewire.org with username krypton1 using SSH on port 2231. You can find the files for other levels in /krypton/***

Open up a local terminal session and decode the base64 encoded string

**`raj@arch:~$ vim base64pass`**  
**`raj@arch:~$ cat base64pass`**  
*`S1JZUFRPTklTR1JFQVQ=`*  
**`raj@arch:~$ base64 -d base64pass`**  
*`KRYPTONISGREAT`*  
**`raj@arch:~$ ssh krypton1@krypton.labs.overthewire.org -p 2231`**
