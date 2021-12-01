# Raspi-Config

Raspberry Pi related scripts and settings

Note: This repo is a draft, main purpose is to serve as a backup as I go along experimenting. I haven't spend much time _prettifying_ it i.e. (my usual level of comments and testing) as the priority was figuring out _what does this button do?_. 


### Run `init.sh`

    curl -s https://scm.genesisrage.net/mrjohndowe/Raspi-Config/raw/branch/master/init.sh | sudo bash

- Overwrites existing `.bashrc` with the one included in this repo
- Setup a pre-defined custom MOTD
- Setup bash aliases for scripts installed 
- Reload all changes

The prupose of this script is to serve as a one click solution for taking care of all the things I usually do after setting up a Pi. These include customizing the bash profile, setting up a login message with useful info. 

The script has some logic built-in, it asks you if you want to install a script, and only installs it if you say yes. If you don't it'll skip that part and move on to the next thing in the script. This is handy when you have for example already configured your ~/.bashrc and do not want to override it.

