***The password for bandit3 is located in a file that has spaces in the filename.***  

**`bandit2@bandit:~$ ls`**  
*`spaces in this filename`*  

Each word in the filename with a space after it will need to be appended with a backslash (\\)

**`bandit2@bandit:~$ cat spaces\ in\ this\ filename`**  
*`aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG`*  
**`bandit2@bandit:~$ ssh bandit3@localhost -p 2220`**  
*`bandit3@localhost's password:`* aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG  

It is worth noting you can use "Tab" on your keyboard to auto-complete file references within the command line. In this instance, you can press Tab after typing in "spaces" to autocomplete the rest of the filename, backslashes included. This technique will be used in later levels to our advantage.
