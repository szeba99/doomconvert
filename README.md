# doomconvert
batch convert images to doom (or any) palette PNG with GIMP batch mode

# Install

dpkg-deb --build doomconvert-deb
    to create a .deb file for linux. Then you can install it by

sudo apt install ./doomconvert-deb.deb
    to install on linux


# ALTERNATIVELY:
    you can use the portable version probably both on linux and windows
    GIMP must be installed to use

# What is this?
    This is a tool to batch convert images to Doom palette format (or any palette if you modify gimp or the .scm file)
    You can either use the command line like this:
    doomconvert image1.jpg image2.jpg
    or 
    You can drag and drop the images to a desktop file, batch file or whatever.
    limitation is that it only works with 3 letters extensions. .jpg converts to .png well but .jpeg will be imagepng without extension.
    
    The way it works is after install it creates a folder in $HOME/.config/doomconvert
    where gimpdoom.scm is copied from etc
    gimpdoom.scm is a gimp script, executes gimp commands.
    You can customize this script for custom effects

    use -d switch to turn on dithering for the palette conversion process
