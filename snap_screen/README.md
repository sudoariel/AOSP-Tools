# snap_screen
This is a tool to take screenshots from Android Emulator in an easy way using the terminal. The screenshots are saved automatically with a custom name or you can set the output filename as you prefer.

## Get started
Get the `snap_screen.sh` file and give it permissions using chmod:
```
chmod 700 snap_screen.sh
```
Run the script. It'll append a function in your `.bashrc` file. 
```
./snap_screen.sh
```
After running the script, make sure that your terminal session is updated with the lastest modification on `.bashrc` or just restart the terminal.
```
source ~/.bashrc
```
Done. The snap_screen tool is added successfuly in your system. With an Android Emulator opened you can run the tool:
```
snap_screen
```
The previous one command will save the screenshot on the current directory as `screenshot_{unix_time}.png`. If you want a customized name, you can run:
```
snap_screen myfilename
```
And it'll be saved as `myfilename.png`.