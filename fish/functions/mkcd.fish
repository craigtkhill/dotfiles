function mkcd --description 'Make directory and change into it'
    if test (count $argv) -eq 0
        echo "Usage: mkcd <directory>"
        return 1
    end

    set target $argv[-1]
    mkdir -p $argv
    and cd $target
end
