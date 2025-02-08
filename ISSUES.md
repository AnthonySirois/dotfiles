## Common issues

### Setting keyboard layout at startup

Ubuntu installs `ibus` by default, which overrides the settings that can be included in `i3` configs. Using the `ibus-setup` command and making sure to check the `use system keyboard layout` 

Thanks to [this post](https://askubuntu.com/questions/707896/keyboard-settings-wont-stay-on-i3) for the solution!

Also, it might be possible that `/etc/default/keyboard` must contain the right config

## Displays are wrong

Use `xrandr` to fix them

1. Run `xrandr --listmonitors` to get display informations
2. Correct the settings using these flags
    - `xrandr --output {target display name} --mode {desired resolution} --pos {[x_position]x[y_position]} --rotate normal`
    - If multiple screens have to be move, simply copy everything from `--output` with the settings for the other screen 
    - Set the primary screen using `--primary`