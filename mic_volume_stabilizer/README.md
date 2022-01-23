# mic_volume_stabilizer
This is a tool to avoid Android Emulator changing the host machine microphone volume randomly causing undesirable noises. It's a small script that runs forever since the system startup and always check if the process related to the Android Emulator `qemu-system-x86` was started. When the process is started, the script forces the host machine microphone volume to be fixed in a specific value declared on `volume.conf` file.

## Get started
- Download the lastest version of `mic_volume_stabilizer`.
- Open the terminal and install the tool using the command `source install.sh`.
- The tool is already installed and by default if you initialize the Android Emulator, it'll set the host machine microphone volume to 50%. You can change this value in the file `volume.conf` located at `$HOME/mic_volume_stabilizer` directory.

## Uninstalling the tool
### Disabling auto-initialization
If you want to disable the script auto-initialization, run the following command:
```
rm ~/.config/autostart/mic_volume_stabilizer.sh.desktop`
```
### Removing the script folder
If you want to remove the tool completely, run the following command:
```
rm -r $HOME/mic_volume_stabilizer
```