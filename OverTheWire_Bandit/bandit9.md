The password for bandit9 is stored in the file data.txt and is the only line of text that occurs only once.

**`bandit8@bandit:~$ ls`**  
*`data.txt`*  

We will need to use a command that will first sort the contents of the file, then deduplicate the rows in the file, only printing out unique results.

**`bandit8@bandit:~$ sort data.txt | uniq -u`**  
*`EN632PlfYiZbn3PhVK3XOGSlNInNE00t`*  
**`bandit8@bandit:~$ ssh bandit9@localhost -p 2220`**  
*`bandit9@localhost's password:`* EN632PlfYiZbn3PhVK3XOGSlNInNE00t
