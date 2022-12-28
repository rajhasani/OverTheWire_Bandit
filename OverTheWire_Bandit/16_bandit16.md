The password for bandit16 can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption.

Simple enough:

**`bandit15@bandit:~$ openssl s_client -connect localhost:30001`**  

You will get a rather large amount of output, displaying the certificate for the connection and the handshake information. At the bottom, you'll be presented with an empty cursor. Go ahead and paste the password in there and hit enter.

*`read R BLOCK`*  
**`jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt`**  
*`Correct!`*  
*`JQttfApK4SeyHwDlI9SXGR50qclOAil1`*  
*`closed`*  
