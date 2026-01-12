function backup --description 'Create a timestamped backup of a file'
    if test (count $argv) -ne 1
        echo "Usage: backup <file>"
        return 1
    end

    if not test -e $argv[1]
        echo "Error: '$argv[1]' does not exist"
        return 1
    end

    set -l timestamp (date +%Y%m%d_%H%M%S)
    set -l backup_name "$argv[1].backup.$timestamp"
    
    cp -r $argv[1] $backup_name
    and echo "Backup created: $backup_name"
end
