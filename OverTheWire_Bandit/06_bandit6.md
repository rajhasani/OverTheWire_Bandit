The password for bandit6 is stored somewhere in a directory with defined attributes (human-readable, 1033 bytes in size, non-executable).

**`bandit5@bandit:~$ ls`**  
*`inhere`*  
**`bandit5@bandit:~$ cd inhere`**  
**`bandit5@bandit:~/inhere$ ls`**  
*`maybehere00  maybehere02  maybehere04  maybehere06  maybehere08  maybehere10  maybehere12  maybehere14  maybehere16  maybehere18 maybehere01  maybehere03  maybehere05  maybehere07  maybehere09  maybehere11  maybehere13  maybehere15  maybehere17  maybehere19`*  

We have quite a lot of directories in here, so manually sifting through each is out. The only concrete attribute we have at this time is the size of the file, so we can begin our process of elimination here.  

**`bandit5@bandit:~/inhere$ find -size 1033c`**  
*`./maybehere07/.file2`*  

Well look at that; only one file in the entire 'inhere' directory has a filesize of 1033 bytes.  

**`bandit5@bandit:~/inhere$ cat ./maybehere07/.file2`**  
*`P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU `*  
