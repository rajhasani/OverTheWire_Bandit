***There is a git repository at ssh://bandit27-git@localhost/home/bandit27-git/repo. The password for the user bandit27-git is the same as for the user bandit27. Clone the repository and find the password for the next level.***  

This is fairly straightforward; we will clone the repository, which is located on the localhost. We need to do two things to accomplish this:
1. We need to navigate to a directory which has write access enabled (the temp directory created previously should already have these permissions enabled, but we'll reenable it again just to be sure)
2. Since the repo is located on localhost and will be cloned from SSH, we need to append port 2220 to the link git repo link provided

**`bandit27@bandit:~$  cd /tmp/rajh`**  
**`bandit27@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit27@bandit:/tmp/rajh$ git clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo`**  

We are prompted for a password here for bandit27-git, but are told earlier it's the same password as the password for bandit27. Complete the clone.

**`bandit27@bandit:/tmp/rajh$ ls`**  
*`repo`*  
**`bandit27@bandit:/tmp/rajh$ cd repo`**  
**`bandit27@bandit:/tmp/rajh/repo$ ls`**  
*`README`*  
**`bandit27@bandit:/tmp/rajh/repo$ cat README`**  
*`The password to the next level is: AVanL161y9rsbcJIsFHuw35rjaOM19nR`*
