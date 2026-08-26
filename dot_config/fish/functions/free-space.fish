function free-space -d "Free disk space by pruning unused data (Docker, etc.)"
    if command -v docker >/dev/null
        docker system prune -a
    else
        echo "docker not found"
    end
end
