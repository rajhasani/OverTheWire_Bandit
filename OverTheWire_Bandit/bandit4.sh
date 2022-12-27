## The password for bandit4 is stored in a hidden file in a directory. We will first need to navigate to the directory in question, and then discover the hidden file.

bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere
bandit3@bandit:~/inhere$ ls -a
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
bandit3@bandit:~/inhere$ ssh bandit4@localhost -p 2220
bandit4@localhost's password: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
