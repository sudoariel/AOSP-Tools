# Author: Ariel Lima Andrade

DIR="$HOME/mic_volume_stabilizer"
echo "Creating folder $DIR"
mkdir -p $DIR
echo "Copying files to $DIR"
cp mic_volume_stabilizer.sh $DIR
cp volume.conf $DIR
echo "Enabling permissions to mic_volume_stabilizer.sh"
chmod +777 $DIR/mic_volume_stabilizer.sh
echo "Setting auto-initialization..."
cat << EOF > ~/.config/autostart/mic_volume_stabilizer.sh.desktop
[Desktop Entry]
Type=Application
Exec=$DIR/mic_volume_stabilizer.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=mic_volume_stabilizer
Name=mic_volume_stabilizer
Comment[en_US]=Volume Stabilizer for Android Emulator
Comment=Volume Stabilizer for Android Emulator
EOF
echo "mic_volume_stabilizer installed."
$DIR/mic_volume_stabilizer.sh &
echo "mic_volume_stabilizer initialized."