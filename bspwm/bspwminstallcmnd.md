sudo apt install bspwm sxhkd polybar picom dmenu dunst nitrogen ranger alacritty

cd ~/.config

mkdir bspwm sxhkd polybar picom dunst

cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/

cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/

cp /etc/xdg/picom.conf picom/

cp /etc/polybar/config.ini polybar/

cp /etc/dunst/dunstrc dunst/

cd bspwm/

chmod +x bspwmrc
