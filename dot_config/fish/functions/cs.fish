function cs --description "Open a cheatsheet with glow"
    set cheatsheet ~/cheatsheets/$argv[1].md
    if test -f $cheatsheet
        glow $cheatsheet
    else
        echo "No cheatsheet for '$argv[1]'"
        echo "Available:"
        for f in ~/cheatsheets/*.md
            echo "  "(basename $f .md)
        end
    end
end
