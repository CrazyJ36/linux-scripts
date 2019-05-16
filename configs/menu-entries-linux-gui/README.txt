How to create A shortcut:
make new file: ~/.local/share/applications/filename.desktop
edit as text like so:


[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Custom Name
Exec=Custom Command
Comment[en_US]=Tooltip Text
Path=Working Directory


'Exec=Custom Command' should be the same commands as if typing in bash.
eg. x-terminal-emulator -e jshell

type these values to put your shortcut into lxde categories:
Accessories <-> Utility
Graphics <-> Graphics
Internet <-> Network
Office <-> Office
Sound & Video <-> AudioVideo
System Tools <-> System

other category keywords:
Audio
Video
Development
Education
Game
Science
Settings

When done type(for lxde): lxpanelctl restart

Note:
For Files already in this folder

Put these .desktop files in:
 ~/.local/share/applications

then, you can find the app launcher in:
menu://other
