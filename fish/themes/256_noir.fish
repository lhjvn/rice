function fish_prompt
    set -l RESET       (set_color normal)
    set -l BG16        (set_color -b black)

    set -l FG250       (set_color -c 250)
    set -l FG245       (set_color -c 245)
    set -l FG240       (set_color -c 240)
    set -l FG232       (set_color -c 232)

    set -l FG_RED     (set_color -c 196)
    set -l BG_DARKRED (set_color -b 88)
    set -l FG_WHITE   (set_color -c 255)

    set -l status $status

    if test $status -eq 0
        set -l STATUS_COLOR $FG240
        set -l STATUS_BG $BG16
    else
        set -l STATUS_COLOR $FG_WHITE
        set -l STATUS_BG $BG_DARKRED
    end

    set -l cwd (prompt_pwd)
    set -l git (fish_git_prompt 2>/dev/null)

    set -l sym "❯"
    echo -n $STATUS_BG $STATUS_COLOR $sym $RESET " "

    echo -n $BG16 $FG245 $cwd $RESET

    if test -n "$git"
        echo -n $BG16 $FG240 " "$git $RESET
    end

    if test $status -eq 0
        echo -n $BG16 $FG250 " "$RESET
    else
        echo -n $BG16 $FG_RED " "$RESET
    end
end

