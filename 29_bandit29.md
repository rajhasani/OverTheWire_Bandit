***There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo. The password for the user bandit28-git is the same as for the user bandit28. Clone the repository and find the password for the next level.***

These instructions look familiar; let's try the same process as before and see what's different this time. 

**`bandit28@bandit:~$  cd /tmp/rajh`**  
**`bandit28@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit28@bandit:/tmp/rajh$ git clone ssh://bandit28-git@localhost:2220/home/bandit28-git/repo`**  
**`bandit28@bandit:/tmp/rajh$ ls`**  
*`repo`*  
**`bandit28@bandit:/tmp/rajh$ cd repo`**  
**`bandit28@bandit:/tmp/rajh/repo$ ls`**  
*`README.md`*  
**`bandit28@bandit:/tmp/rajh/repo$ cat README.md`**  
```
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: xxxxxxxxxx
```

We've come across what appears to be a censored password, or rather, it has been masked/replaced. Let's check the recent commit history of the markdown file:

**`bandit28@bandit:/tmp/rajh/repo$ git show`**  
```
commit 5f45cfaca938393c7706fec16ab1ca627e947f64 (HEAD -> master, origin/master, origin/HEAD)
Author: Morla Porla <morla@overthewire.org>
Date:   Sat Dec 3 08:14:06 2022 +0000

    fix info leak

diff --git a/README.md b/README.md
index b302105..5c6457b 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for level29 of bandit.
 ## credentials

 - username: bandit29
-- password: tQKvmcwNYcFS6vmPHIUSI3ShmsrQZK8S
+- password: xxxxxxxxxx
```

The change is shown towards the bottom; looks like the second-to-last line was removed, and replaced with the last line in the commit. 
