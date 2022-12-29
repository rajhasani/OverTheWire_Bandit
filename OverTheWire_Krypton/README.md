This folder is a level-by-level write-up of OverTheWire's Krypton wargame.

The guide and instructions for each level can be accessed at https://overthewire.org/wargames/krypton/

You will need to connect to krypton.labs.overthewire.org via SSH on port 2231. The username you will be using to access the first level is krypton1; hence, the proper input will be:  
**`$ ssh krypton1@krypton.labs.overthewire.org -p 2231`**

When progressing to the next levels, it is not required you end your current SSH session; you can simply reference localhost, still utilizing port 2231. For example:  
**`$ ssh krypton2@localhost -p 2231`**

### The filenames in this guide directly pertain to the level you are attempting to access, i.e. the intended solution. Example: 02_krypton2.md is a guide for which you are currently on krypton1, attempting to access krypton2.

Syntax for command I/O is as follows:

* All input commands will be in **`bolded code span`**  
* All output from commands will be either in
  * *`italicized code span`* OR
  * 
  ``` 
  fenced
  code 
  blocks 
  ```

It is worth noting that items like passwords and RSA keys are subject to change at OverTheWire's sole discretion. The passwords displayed in this guide will be current as the time of publication. I will NOT be revisiting/revising the guide to update passwords and RSA keys; however, the overall process will remain unchanged.
