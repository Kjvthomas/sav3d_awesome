#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

## run (only once) processes which spawn with different name
if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    gnome-keyring-daemon --daemonize --login &
fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
#if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    #/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
#fi
if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi
# System-config-printer-applet is not installed in minimal edition
if (command -v system-config-printer-applet && ! pgrep applet.py ); then
  system-config-printer-applet &
fi

run xfsettingsd
run nm-applet
run light-locker
run compton --shadow-exclude '!focused'
run xcape -e 'Super_L=Super_L|Control_L|Escape'
#run thunar --daemon
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run pa-applet
run volumeicon
run pamac-tray
run conky
run dwall -s earth
run numlockx on
# blueman-applet and msm_notifier are not installed in minimal edition
run blueman-applet
run msm_notifier
run torguard
#run ulauncher
run /home/sav3d/Applications/Nextcloud-3.3.1-x86_64_332d890d59fed28c70f0e58f2a1b04f3.AppImage
