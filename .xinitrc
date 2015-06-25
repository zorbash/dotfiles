[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
compton -b --vsync opengl
