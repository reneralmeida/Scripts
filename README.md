### Scripts I've used over the years

#### Automated.ps1

I made this one to automate my latest PC DDR4 and M.2 SSD RGB settings.
Anyone with an Asrock motherboard can use it, it's purpose is to load the current RGB setting in the background during system startup and kill the Asrock Polychrome RGB software after a minute.
It's been my experience that unfortunately Asrock RGB software is quite buggy and if I left it to run permanently with every startup it would result in the app crashing or spitting out an error.
With this script set as a schedule task in Windows that problem disappeared and my preferred RGB settings are loaded with every system startup in the background successfully.
The automated.bat is included because I've had better luck using the .bat that points to the .ps1 in Windows Task Scheduler.

#### Batch.bat

Simple ffmpeg script to change video extensions (containers) in a given folder.
In its present setting it goes from mkv to mov, but it will work with any container the amazing ffmpeg supports.
Huge props and thanks to the ffmpeg open source community.

#### Gitlab-CI.yml

Two stages automation of build and deployment of two different repositories in Gitlab.
Made and used in accordance with Gitlab's great documentation to facilitate the development of an E-Commerce project that was coded and delivered as the conclusion project of the first year of Digital House's Certified Tech Developer course.

#### Hotspot-on.ps1

Script I put together combining different StackOverFlow suggestions, this is used to extend my wireless local network by checking if the Windows hotspot function is active every 5 minutes.
It's quite simple really, if the hotspot function is active it does nothing, if it's not it activates it and upon doing so if you own a computer that has a dedicated wireless card you can set the hotspot name and password to match your local network, thus extending your WiFi signal to the rooms surrounding your PC.
Ideally used as a Windows scheduled task, hence why the hotspot-on.bat is included.





