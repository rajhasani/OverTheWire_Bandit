This folder is a level-by-level write-up of OverTheWire's Bandit wargame, which is intended to be an elementary introduction to basic Linux commands.

The guide and instructions for each level can be accessed at https://overthewire.org/wargames/bandit/

You will need to connect to bandit.labs.overthewire.org via SSH on port 2220. The username you will be using to access the first level is bandit0; hence, the proper input will be:  
**`$ ssh bandit0@bandit.labs.overthewire.org -p 2220`**

When progressing to the next levels, it is not required you end your current SSH session; you can simply reference localhost, still utilizing port 2220. For example:  
**`$ ssh bandit1@localhost -p 2220`**

The filenames in this guide directly pertain to the level you are attempting to access.

Syntax for command I/O is as follows:

* All input commands will be in **`bolded code span`**  
* All output from commands will be either in
  * *`italicized code span`* OR
  * ``` fenced code blocks ```

It is worth noting that items like passwords and RSA keys are subject to change at OverTheWire's sole discretion. The passwords displayed in this guide will be current as the time of publication. I will NOT be revisiting/revising the guide to update passwords and RSA keys; however, the overall process will remain unchanged.
