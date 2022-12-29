***There is a git repository at ssh://bandit30-git@localhost/home/bandit30-git/repo. The password for the user bandit30-git is the same as for the user bandit30. Clone the repository and find the password for the next level.***  

**`bandit30@bandit:~$  cd /tmp/rajh`**  
**`bandit30@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit30@bandit:/tmp/rajh$ git clone ssh://bandit30-git@localhost:2220/home/bandit30-git/repo`**  
**`bandit30@bandit:/tmp/rajh$ ls`**  
*`repo`*  
**`bandit30@bandit:/tmp/rajh$ cd repo`**  
**`bandit30@bandit:/tmp/rajh/repo$ ls`**  
*`README.md`*  
**`bandit30@bandit:/tmp/rajh/repo$ cat README.md`**  
*`just an epmty file... muahaha`*  
**`bandit30@bandit:/tmp/rajh/repo$ git branch -r`**  
```
  origin/HEAD -> origin/master
  origin/master
```

So there are no viewable changes to the original commit, and no other branches for us to use. Let's take a look at the repo tags:

**`bandit30@bandit:/tmp/rajh/repo$ git tag`**  
*`secret`*  

Hmmmm...

**`bandit30@bandit:/tmp/rajh/repo$ git show secret`**  
*`OoffzGDlzhAlerFJ2cAiz1D41JW1Mhmt`*
