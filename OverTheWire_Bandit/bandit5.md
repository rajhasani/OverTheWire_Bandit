The password for bandit5 is located in the "inhere" directory, and is apparently the only "human-readable" file within the directory. We will need to find a way to quickly determine which file that is. 

**`bandit4@bandit:~$ ls`**  
*`inhere`*  
**`bandit4@bandit:~$ cd inhere`**  
**`bandit4@bandit:~/inhere$ ls`**  
*`-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09`*  
Looks like there are 10 files, each beginning with a dash. Rather than analyze each of these files one-by-one, we can do this with one command, referencing all filenames with a wildcard since their naming conventions are similar.  
**`bandit4@bandit:~/inhere$ file ./-file0*`**  
*`./-file00: data`*  
*`./-file01: data`*  
*`./-file02: data`*  
*`./-file03: data`*  
*`./-file04: data`*  
*`./-file05: data`*  
*`./-file06: data`*  
*`./-file07: ASCII text`*  
*`./-file08: data`*  
*`./-file09: data`*  
-file07 appears to be the odd one out. Let's take a look.  
**`bandit4@bandit:~/inhere$ cat ./-file07`**  
*`lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR`*  
**`bandit4@bandit:~/inhere$ ssh bandit5@localhost -p 2220`**  
*`bandit5@localhost's password:`* lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
