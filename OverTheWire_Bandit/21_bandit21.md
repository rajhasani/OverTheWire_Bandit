***There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for bandit21.***

Let's first gather the correct syntax for the usage of the setuid binary by executing it without arguments:

**`bandit20@bandit:~$ ls`**  
*`suconnect`*  
**`bandit20@bandit:~$ ./suconnect`**  
*`Usage: ./suconnect <portnumber>`*  
*`This program will connect to the given port on localhost using TCP. If it receives the correct password from the other side, the next password is transmitted back.`*  

So there are a couple steps needed to accomplish this. First, we need to set the localhost to listen on a port that we specify; next, we need to connect to that port using the setuid binary. Since this requires having two commands running simultaneously, this is an excellent use-case for tmux, a terminal multiplexer, which allows us to have two separate terminal panes running in one terminal emulator window:

**`bandit20@bandit:~$ tmux`**

You will now be within tmux. Hit Ctrl + B, then % to split the terminal into two. You can navigate between the panes by hitting Ctrl + B, and then the arrow key corresponding to the direction you wish to move to. 

In the left pane, we will set up localhost to listen in on a random port, and ensure the current password is passed to the session; I'll use 35000 in this case:

**`bandit20@bandit:~$ echo VxCazJaVykI6W36BkBU0mJTCM8rR95XT | nc -l localhost 35000`**  

Let's now switch to the right pane (Ctrl + B, right arrow key), and run the setuid binary with the port we specified.

**`bandit20@bandit:~$ ./suconnect 35000`**  
*`Read: VxCazJaVykI6W36BkBU0mJTCM8rR95XT`*  
*`Password matches, sending next password`*  

If you look back at the left window, you'll see that a password has returned, and the netcat connection has closed:

*`NvEJF7oVjkddltPSrdKEFOllh9V1IBcq`*  
**`bandit20@bandit:~$ exit`**

You will now have returned to the main bandit terminal; proceed to authenticate to bandit21.
