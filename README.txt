# Unix System Administration(Linux)  Assignment 2 - Shell Scripting

## Introduction

The script `unix_assignment2.sh` is to achieve following features:
  - A. Read the contents from the folder `/sys/class/leds` then display every item at each line;
  - B. Allow you to operate the selected led;
  - C. Read the contents of the file `trigger` of the selected led then list every event at each line,and replace 
      `[` and `]` that around event with `*`. E.g `[test]` will be converted to `test*`

## Requirements

You will need:

  - access to your `raspberry pi`
  - an account that allow you to connect to your `raspberry pi`
  - the IP Address or Host name of your `raspberry pi` 
  - to be able to SSH with your `raspberry pi` using your PC
  
      * [Windows] PuTTY & WinSCP
      * [macOS] Terminal
      * [Linux] Bash

  - a copy of script on your PC
   
      * unix_assignment2.sh

## Instructions

1)  Move all scripts to a directory where you wish to save the script on your raspberry pi

1a) [Windows]

    Run `WinSCP` and enter the server, username and password when prompted:

    ```
    IP Address (or Host Name) (e.g 13.236.56.5)
    Port: 22
    ```
    Finally, drag the scripts to the desired location on the raspberry pi

1b) [macOS/Linux]

    Run `Terminal|Bash` with `scp [source] [user]@[server]:[destination]`

    ```
    e.g. scp e.g scp /opt/unix_assignment2.sh pi@13.236.56.5:/home/pi
    ```
   
    "/opt/" is the path where you save the script `unix_assigment2.sh`

2)  Connect to your `raspberry pi`

2a) [Windows]

    Run `PuTTY` and SSH to the server (see `WinSCP` instructions)

2b) [macOS/Linux]

    Run `Terminal/Bash` and enter `ssh [user]@(IP_Address or Host_Name)`

    ```
    e.g.  ssh s3538463@13.236.65.5

3)  Relocate to the directory where you save the script using `cd [script_directory]`

    ```
    e.g. cd /home/pi
    ```         
    
4)  Grant permission to the script with command `chmod +x [script_file_name]`

    ```
    e.g chmod +x unix_assignment2.sh
    ```
5)  Run the script with command `bash [script_file_name]`
  
    ```
    e.g bash unix_assignment2.sh
    ```   

#Explanation
This script is only implemented the basic features.While you run the script `unix_assignment2.sh` you will 
see the first level menu which will display all the led information. While you select any of them, the second 
level menu will be displayed and you can `turn on`, `turn off` or list the content of the `trigger` file then 
exit the script after you are done the operation.However,we can optimize this script in future as needed. 
