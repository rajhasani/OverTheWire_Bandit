***There is a git repository at ssh://bandit31-git@localhost/home/bandit31-git/repo. The password for the user bandit31-git is the same as for the user bandit31. Clone the repository and find the password for the next level.***

**`bandit31@bandit:~$  cd /tmp/rajh`**  
**`bandit31@bandit:/tmp/rajh$ chmod 777 /tmp/rajh`**  
**`bandit31@bandit:/tmp/rajh$ git clone ssh://bandit31-git@localhost:2220/home/bandit31-git/repo`**  
**`bandit31@bandit:/tmp/rajh$ ls`**  
*`repo`*  
**`bandit31@bandit:/tmp/rajh$ cd repo`**  
**`bandit31@bandit:/tmp/rajh/repo$ ls`**  
*`README.md`*  
**`bandit31@bandit:/tmp/rajh/repo$ cat README.md`**  
```
This time your task is to push a file to the remote repository.

Details:
    File name: key.txt
    Content: 'May I come in?'
    Branch: master
```

Our steps are as follows: 
1. Create a text file with the specified text within the repo folder
2. Add the file to git
3. Commit the file
4. Push to the master branch in the repo

**`bandit31@bandit:/tmp/rajh/repo$ git status`**  
```
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

Well we're already in the master branch, so let's get to work:

**`bandit31@bandit:/tmp/rajh/repo$ vim key.txt`**  
**`bandit31@bandit:/tmp/rajh/repo$ cat key.txt`**  
*`May I come in?`*  
**`bandit31@bandit:/tmp/rajh/repo$ git add key.txt -f`**  
**`bandit31@bandit:/tmp/rajh/repo$ git status`**  
```
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   key.txt
```

Changes cannot be committed without a message of some sort:

**`bandit31@bandit:/tmp/rajh/repo$ git commit -m "adding file"`**  
```
[master 03f438f] adding file
 1 file changed, 1 insertion(+)
 create mode 100644 key.txt
```
**`bandit31@bandit:/tmp/rajh/repo$ git push`**  

Re-enter the password for bandit31 when prompted.

```
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 323 bytes | 323.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
remote: ### Attempting to validate files... ####
remote:
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote:
remote: Well done! Here is the password for the next level:
remote: rmCBvG56y58BXzv98yZGdO7ATVL5dW8y
..
..
```
