DOTFILES_ROOT=$(pwd -P)
CONFIG_ROOT=${XDG_CONFIG_HOME:-"$HOME/.config"}

set -e

info() {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

link_file() {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; 
    then

        if [ "$overwrite_all" = false ] && [ "$backup_all" = false ] && [ "$skip_all" = false ]; then

            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" = "$src" ];
            then
                skip=true
            else

                user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
                [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read action

                case "$action" in
                o)
                    overwrite=true
                    ;;
                O)
                    overwrite_all=true
                    ;;
                b)
                    backup=true
                    ;;
                B)
                    backup_all=true
                    ;;
                s)
                    skip=true
                    ;;
                S)
                    skip_all=true
                    ;;
                *) ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" = true ]; then
            rm -rf "$dst"
            success "removed $dst"
        fi

        if [ "$backup" = true ];
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" = true ];
        then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != true ]; then # "false" or empty
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

install_dotfiles() {
    info 'installing dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$DOTFILES_ROOT" -maxdepth 3 -name '*.symlink'); do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done

    # TODO Find a better way to link folders to .config
    link_file "$DOTFILES_ROOT/alacritty" "$CONFIG_ROOT/alacritty"
    link_file "$DOTFILES_ROOT/i3" "$CONFIG_ROOT/i3"
    link_file "$DOTFILES_ROOT/dunst" "$CONFIG_ROOT/dunst"
    link_file "$DOTFILES_ROOT/polybar" "$CONFIG_ROOT/polybar"
    link_file "$DOTFILES_ROOT/rofi" "$CONFIG_ROOT/rofi"
    link_file "$DOTFILES_ROOT/bottom" "$CONFIG_ROOT/bottom"
    link_file "$DOTFILES_ROOT/gtk-3.0/settings.ini" "$CONFIG_ROOT/gtk-3.0/settings.ini"
}

install_dotfiles

echo 'All installed!'
