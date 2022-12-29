***There is a git repository at ssh://bandit29-git@localhost/home/bandit29-git/repo. The password for the user bandit29-git is the same as for the user bandit29. Clone the repository and find the password for the next level.***

Rinse and repeat; something must be different.

**`bandit29@bandit:~$  cd /tmp/rajh`**  
**`bandit29@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit29@bandit:/tmp/rajh$ git clone ssh://bandit29-git@localhost:2220/home/bandit29-git/repo`**  
**`bandit29@bandit:/tmp/rajh$ ls`**  
*`repo`*  
**`bandit29@bandit:/tmp/rajh$ cd repo`**  
**`bandit29@bandit:/tmp/rajh/repo$ ls`**  
*`README.md`*  
**`bandit29@bandit:/tmp/rajh/repo$ cat README.md`**  
```
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: <no passwords in production!>
```
**`bandit29@bandit:/tmp/rajh/repo$ git show`**  
```
commit 10dc96bdd891b1a65af3d5711630c1dfd65dba79 (HEAD -> master, origin/master, origin/HEAD)
Author: Ben Dover <noone@overthewire.org>
Date:   Sat Dec 3 08:14:07 2022 +0000

    fix username

diff --git a/README.md b/README.md
index 2da2f39..1af21d3 100644
--- a/README.md
+++ b/README.md
@@ -3,6 +3,6 @@ Some notes for bandit30 of bandit.

 ## credentials

-- username: bandit29
+- username: bandit30
 - password: <no passwords in production!>
 ```
 
 We see the note on the commit is to "fix username", and we see the change in the commit is that "bandit29" was replaced with "bandit30", but no change to the password was ever made in any recent commit. Let's check to see if the repo has other branches:
 
 **`bandit29@bandit:/tmp/rajh/repo$ git branch -r`**  
 ```
  origin/HEAD -> origin/master
  origin/dev
  origin/master
  origin/sploits-dev
 ```
 
 Looks like there are other branches; we are currently in the origin/master branch. The markdown in the master branch states no passwords in prod, so perhaps it's in dev:
 
 **`bandit29@bandit:/tmp/rajh/repo$ git show origin/dev`**  
 ```
 commit 4177db8d2e8f795a23b911550ee864880ae643ff (origin/dev)
Author: Morla Porla <morla@overthewire.org>
Date:   Sat Dec 3 08:14:07 2022 +0000

    add data needed for development

diff --git a/README.md b/README.md
index 1af21d3..a4b1cf1 100644
--- a/README.md
+++ b/README.md
@@ -4,5 +4,5 @@ Some notes for bandit30 of bandit.
 ## credentials

 - username: bandit30
-- password: <no passwords in production!>
+- password: xbhV3HpNGlTIdnjUrdAlPzc2L6y9EOnS
```
