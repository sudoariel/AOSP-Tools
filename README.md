# AOSP-Tools
AOSP (Android Open Source Project) tools in shell script for Linux to make the work easier.

## AOSP alias
In order to set the AOSP environment quickly you can add an alias in your `.bashrc` file to run a simple command to navigate to the AOSP folder, set the environment and run the lunch command. Append the following line in your `.bashrc`file:
```
alias AOSP='cd $HOME/WORKING_ENVIRONMENT; source build/envsetup.sh; lunch YOUR_COMBO_VERSION; cd $OLDPWD'
```
Where WORKING_ENVIRONMENT is the AOSP directory and YOUR_COMBO_VERSION is the type of your Android OS. This is an example for the combo `sdk_car_x86_64-userdebug`:
```
alias AOSP='cd $HOME/aosp; source build/envsetup.sh; lunch sdk_car_x86_64-userdebug; cd $OLDPWD'
```
After appending the alias line into the `.bashrc` folder you can run the following command to apply the lastest modification into your current terminal session:
```
source ~/.bashrc
```

## snap_screen
This is a tool to take screenshots from Android Emulator in an easy way using the terminal. The screenshots are saved automatically with a custom name or you can set the output filename as you prefer. Before installing this tool, it's necessary to have the previous alias added in your `.bashrc` file. <br>
#### [Get snap_screen](https://github.com/sudoariel/AOSP-Tools/tree/main/snap_screen)

