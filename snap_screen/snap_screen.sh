#!/bin/bash

# Appends a function into .bashrc file to take screenshots on emulator via ADB

cat >> ~/.bashrc << EOT

# Snippet to take screenshot from emulator via adb
snap_screen() {
  if [ \$# -eq 0 ]
  then
    name="screenshot_\`date +%s\`.png"
  else
    name="\$1.png"
  fi
  # AOSP is the terminal alias for opening the AOSP for opening
  # the working folder, setting the environment and building the 
  # combo version. Remove the following line in case you don't
  # need to use the ADB from AOSP.
  AOSP #remove if using ADB outside AOSP
  adb shell screencap -p /sdcard/\$name
  adb pull /sdcard/\$name
  adb shell rm /sdcard/\$name
  echo "Screenshot saved at \`pwd\`/\$name."
}
EOT
source ~/.bashrc

echo "snap_screen added on .bashrc file successfully."
echo "Restart the terminal and you'll be able to run."
echo "Run snap_screen with Android Emulator opened and the tool will take a screenshot and save as screenshot_{unix_time}.png on your current terminal folder."
echo "If you want to set the output file name you can pass it as an argument: snap_screen filename.png"